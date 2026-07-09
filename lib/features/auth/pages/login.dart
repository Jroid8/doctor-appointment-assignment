import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/widgets/brand.dart';
import 'package:doctor_appointment/features/auth/pages/forget_password_1.dart';
import 'package:doctor_appointment/features/auth/pages/signup.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/auth/utils/email_validator.dart';
import 'package:doctor_appointment/features/auth/widgets/continue_with.dart';
import 'package:doctor_appointment/features/auth/widgets/header.dart';
import 'package:doctor_appointment/features/auth/widgets/or_divider.dart';
import 'package:doctor_appointment/features/auth/widgets/text_form_field.dart';
import 'package:doctor_appointment/features/home/pages/home.dart';
import 'package:doctor_appointment/utils/dio_error_message.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatelessWidget {
  final ClientSessionManager sessionMgr;

  const LoginPage(this.sessionMgr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            SizedBox(height: 32, width: 0),
            Brand(),
            SizedBox(height: 32, width: 0),
            AuthHeader("Hi, Welcome Back!", "Hope you’re doing fine."),
            SizedBox(height: 32, width: 0),
            _LoginForm(sessionMgr),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final ClientSessionManager sessionMgr;

  const _LoginForm(this.sessionMgr);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        ActiveSession? session = await widget.sessionMgr.login(
          email: emailController.text,
          password: passwordController.text,
        );
        if (session == null) {
          toastification.show(
            autoCloseDuration: Duration(seconds: 3),
            type: .error,
            style: .fillColored,
            title: Text("Incorrect email or password"),
          );
        } else {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    HomePage(session: session, sessionMgr: widget.sessionMgr),
              ),
            );
          }
        }
      } catch (e) {
        String message = e is DioException ? dioErrorMessage(e) : e.toString();
        toastification.show(
          autoCloseDuration: Duration(seconds: 3),
          type: .error,
          style: .fillColored,
          title: Text("Failed to create account"),
          description: Text(message),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: gappedWidgetStack(
        gap: 23,
        orientation: Axis.vertical,
        crossAxisAlignment: .stretch,
        children: [
          AuthTextFormField(
            validator: EmailValidator.validate,
            controller: emailController,
            icon: "assets/images/mail.svg",
            label: "Your Email",
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
            child: FilledButton(onPressed: submit, child: const Text("Login")),
          ),
          OrDivider(),
          ContinueWithGooBook(),
          _ForgotPassword(widget.sessionMgr.authServer),
          _SwitchToSignup(widget.sessionMgr),
        ],
      ),
    );
  }
}

class _SwitchToSignup extends StatelessWidget {
  final ClientSessionManager sessionMgr;

  const _SwitchToSignup(this.sessionMgr);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text("Don't have an account yet? "),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(builder: (_) => SignUpPage(sessionMgr)),
            );
          },
          child: Text("Sign up", style: TextStyle(color: Color(0xFF1C64F2))),
        ),
      ],
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  final AuthServerRepo authServer;

  const _ForgotPassword(this.authServer);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(name: "pwd-reset-p1"),
              builder: (_) => ForgetPasswordPage1(authServer),
            ),
          );
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Color(0xFF1C64F2)),
        ),
      ),
    );
  }
}
