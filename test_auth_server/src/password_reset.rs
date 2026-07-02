use actix_web::{
    HttpResponse,
    web::{self, Data},
};
use serde::Deserialize;

use crate::ServerState;

#[derive(Debug, Clone, Copy)]
pub struct ResetRequest {
    user: usize,
    stage: ResetStage,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ResetStage {
    EmailSent(u32),
    ResetTokenSent([u8; 32]),
}

pub async fn request(email: String, state: Data<ServerState>) -> HttpResponse {
    let accounts = state.accounts.read().unwrap();
    if state
        .password_reset
        .read()
        .unwrap()
        .iter()
        .find(|prr| accounts[prr.user].email == email)
        .is_none()
        && let Some(client) = accounts.iter().find(|c| c.email == email)
    {
        let code = rand::random_range(0..100000);
        println!("reset code: {code}");
        state.password_reset.write().unwrap().push(ResetRequest {
            user: client.id,
            stage: ResetStage::EmailSent(code),
        })
    }
    HttpResponse::Accepted().finish()
}

#[derive(Clone, Debug, Deserialize)]
pub struct ResetCodeVerification {
    code: u32,
    email: String,
}

pub async fn verify(
    web::Form(form): web::Form<ResetCodeVerification>,
    state: Data<ServerState>,
) -> HttpResponse {
    let accounts = state.accounts.read().unwrap();
    if let Some(req) = state
        .password_reset
        .write()
        .unwrap()
        .iter_mut()
        .find(|req| accounts[req.user].email == form.email)
    {
        if let ResetStage::EmailSent(sent_code) = req.stage
            && form.code == sent_code
        {
            let mut session_token = [0; 32];
            rand::fill(&mut session_token);
            req.stage = ResetStage::ResetTokenSent(session_token);
            println!("{session_token:?}");
            HttpResponse::Created().body(session_token.to_vec())
        } else {
            HttpResponse::Unauthorized().finish()
        }
    } else {
        HttpResponse::Unauthorized().finish()
    }
}

#[derive(Clone, Debug, Deserialize)]
pub struct CompleteReset {
    token: [u8; 32],
    password: String,
}

pub async fn complete(data: web::Json<CompleteReset>, state: Data<ServerState>) -> HttpResponse {
    if let Some(req) = state
        .password_reset
        .read()
        .unwrap()
        .iter()
        .find(|req| req.stage == ResetStage::ResetTokenSent(data.token))
    {
        let mut accounts = state.accounts.write().unwrap();
        let client = accounts.iter_mut().find(|c| c.id == req.user).unwrap();
        client.password = data.0.password;
        println!("password changed");
        HttpResponse::NoContent().finish()
    } else {
        HttpResponse::Unauthorized().finish()
    }
}
