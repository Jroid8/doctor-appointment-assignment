import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/common/singletons/server_conn.dart';
import 'package:doctor_appointment/features/auth/pages/login.dart';
import 'package:doctor_appointment/features/auth/repos/client_picture.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/auth/utils/email_validator.dart';
import 'package:doctor_appointment/features/auth/widgets/text_form_field.dart';
import 'package:doctor_appointment/features/home/pages/home.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

class DemoSettingsPage extends StatefulWidget {
  const DemoSettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DemoSettingsPageState();
}

class _DemoSettingsPageState extends State<DemoSettingsPage> {
  bool useRemote = false;

  @override
  void initState() {
    checkForLocal();
    super.initState();
  }

  Future<void> checkForLocal() async {
    final sessions = await LocalDB.instance.clientSessionTbl.select().get();
    if (sessions.isNotEmpty) {
      final ClientSessionManager mgr = ClientSessionManager(
        LocalDB.instance,
        MockAuthServerRepo(
          ClientInfo(id: 8, name: "jamshid", email: "jamshid@gmail.com"),
          "1234",
        ),
      );
      final ActiveSession session = (await mgr.loadLocal())!;
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(session: session, sessionMgr: mgr),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .all(32),
        child: Column(
          children: [
            gappedWidgetStack(
              gap: 16,
              orientation: Axis.horizontal,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Mock", style: TextTheme.of(context).labelLarge),
                Switch(
                  value: useRemote,
                  onChanged: (newValue) {
                    setState(() {
                      useRemote = !useRemote;
                    });
                  },
                ),
                Text("Remote Server", style: TextTheme.of(context).labelLarge),
              ],
            ),
            SizedBox(height: 16),
            Expanded(child: useRemote ? _RemoteSettings() : _MockSettings()),
          ],
        ),
      ),
    );
  }
}

class _MockSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MockSettingsState();
}

class _MockSettingsState extends State<_MockSettings> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (_formKey.currentState!.validate()) {
      final ClientInfo client = ClientInfo(
        id: 1,
        email: emailController.text,
        name: nameController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(
            ClientSessionManager(
              LocalDB.instance,
              MockAuthServerRepo(client, passwordController.text),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: gappedWidgetStack(
        crossAxisAlignment: .stretch,
        gap: 12,
        orientation: .vertical,
        children: [
          AuthTextFormField(
            controller: nameController,
            icon: "assets/images/user.svg",
            label: "Your Name",
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter your full name"
                : null,
          ),
          AuthTextFormField(
            controller: emailController,
            icon: "assets/images/mail.svg",
            label: "Your Email",
            validator: EmailValidator.validate,
          ),
          AuthTextFormField(
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter a password"
                : null,
            controller: passwordController,
            icon: "assets/images/lock.svg",
            label: "Password",
            mustObscure: true,
          ),
          SizedBox(
            height: 48,
            child: FilledButton(onPressed: submit, child: const Text("Go")),
          ),
        ],
      ),
    );
  }
}

class _RemoteSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RemoteSettingsState();
}

class _RemoteSettingsState extends State<_RemoteSettings> {
  final TextEditingController hostController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (_formKey.currentState!.validate()) {
      ServerConn().dio.options.baseUrl =
          "http://${hostController.text}:${portController.text}";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(
            ClientSessionManager(
              LocalDB.instance,
              RemoteAuthServerRepo(ServerConn(), MockClientPictureRepo()),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          AuthTextFormField(
            controller: hostController,
            label: "Host",
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter the host"
                : null,
          ),
          SizedBox(height: 12),
          AuthTextFormField(
            label: "Port",
            controller: portController,
            inputType: TextInputType.number,
            validator: (input) {
              final String? msg = (input == null || input.isEmpty)
                  ? "Please enter a port"
                  : null;
              if (msg == null) {
                int? value = int.tryParse(input!);
                if (value == null) {
                  return "Please enter a number";
                } else if (value <= 0 || value >= 99999) {
                  return "Please enter a number between 1 and 99999";
                } else {
                  return null;
                }
              } else {
                return msg;
              }
            },
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 48,
            child: FilledButton(onPressed: submit, child: const Text("Go")),
          ),
        ],
      ),
    );
  }
}
