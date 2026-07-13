use std::{
    collections::HashMap,
    sync::{RwLock, RwLockWriteGuard},
};

use actix_web::{
    App, HttpResponse, HttpServer, mime,
    web::{self, Data},
};
use serde::{Deserialize, Serialize};

use password_reset::{
    ResetRequest as PasswordResetReq, complete as password_reset_complete,
    request as password_reset_request, verify as password_reset_verify,
};

mod password_reset;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Client {
    id: usize,
    name: String,
    email: String,
    phone_number: Option<String>,
    password: String,
}

#[derive(Debug, Clone, Serialize)]
#[serde(rename_all = "camelCase")]
struct ClientSession<'a> {
    id: usize,
    name: &'a str,
    email: &'a str,
    phone_number: Option<&'a str>,
    #[serde(with = "base64_bytes")]
    session_token: &'a [u8],
}

mod base64_bytes {
    use base64::Engine;
    use serde::Serializer;

    pub fn serialize<S: Serializer>(bytes: &[u8], serializer: S) -> Result<S::Ok, S::Error> {
        let s = base64::engine::general_purpose::STANDARD.encode(bytes);
        serializer.serialize_str(&s)
    }
}

impl<'a> ClientSession<'a> {
    fn from_client(client: &'a Client, session_token: &'a [u8]) -> Self {
        ClientSession {
            id: client.id,
            name: &client.name,
            email: &client.email,
            phone_number: client.phone_number.as_ref().map(String::as_str),
            session_token,
        }
    }
}

#[derive(Debug, Default)]
struct ServerState {
    accounts: RwLock<Vec<Client>>,
    sessions: RwLock<HashMap<Vec<u8>, usize>>,
    password_reset: RwLock<Vec<PasswordResetReq>>,
}

impl ServerState {
    fn new() -> ServerState {
        ServerState {
            accounts: RwLock::new(vec![Client {
                id: 0,
                name: "jamshid".to_string(),
                email: "jamshid@gmail.com".to_string(),
                phone_number: None,
                password: "1234".to_string(),
            }]),
            ..Default::default()
        }
    }
}

fn new_session(mut sessions: RwLockWriteGuard<HashMap<Vec<u8>, usize>>, client: &Client) -> String {
    let mut session_token: Vec<u8> = vec![0; 32];
    rand::fill(&mut session_token);
    let session = &ClientSession::from_client(client, &session_token);
    println!("new session created: {session:?}");
    let body = serde_json::to_string(session).unwrap();
    sessions.insert(session_token, client.id);
    body
}

#[derive(Debug, Clone, Deserialize)]
struct LoginReqFields {
    email: String,
    password: String,
}

async fn login(
    web::Form(form): web::Form<LoginReqFields>,
    state: Data<ServerState>,
) -> HttpResponse {
    if let Some(client) = state
        .accounts
        .read()
        .unwrap()
        .iter()
        .find(|c| c.email == form.email)
        && client.password == form.password
    {
        let client_session_data = new_session(state.sessions.write().unwrap(), client);
        HttpResponse::Created()
            .content_type(mime::APPLICATION_JSON)
            .body(client_session_data)
    } else {
        HttpResponse::Unauthorized().finish()
    }
}

#[derive(Debug, Clone, Deserialize)]
struct SignUpFields {
    name: String,
    email: String,
    password: String,
}

async fn signup(
    web::Form(form): web::Form<SignUpFields>,
    state: Data<ServerState>,
) -> HttpResponse {
    let accounts = state.accounts.read().unwrap();
    if accounts.iter().find(|c| c.email == form.email).is_some() {
        HttpResponse::Conflict().finish()
    } else {
        let id = accounts.len();
        drop(accounts);
        let client = Client {
            id,
            name: form.name,
            email: form.email,
            phone_number: None,
            password: form.password,
        };
        println!("new user created: {client:?}");
        let client_session_data = new_session(state.sessions.write().unwrap(), &client);
        state.accounts.write().unwrap().push(client);
        HttpResponse::Created()
            .content_type(mime::APPLICATION_JSON)
            .body(client_session_data)
    }
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let state = Data::new(ServerState::new());
    HttpServer::new(move || {
        App::new().app_data(state.clone()).service(
            web::scope("/auth")
                .route("/login", web::post().to(login))
                .route("/signup", web::post().to(signup))
                .service(
                    web::scope("/reset-password")
                        .route("/request", web::put().to(password_reset_request))
                        .route("/verify", web::put().to(password_reset_verify))
                        .route("/complete", web::post().to(password_reset_complete)),
                ),
        )
    })
    .bind(("0.0.0.0", 1234))?
    .run()
    .await
}
