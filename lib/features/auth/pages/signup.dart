import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/widgets/brand.dart';
import 'package:doctor_appointment/features/auth/pages/login.dart';
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

class SignUpPage extends StatelessWidget {
  final ClientSessionManager sessionMgr;

  const SignUpPage(this.sessionMgr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(vertical: 0, horizontal: 24),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 32),
            Brand(),
            SizedBox(height: 32),
            AuthHeader("Create Account", "We are here to help you!"),
            SizedBox(height: 32),
            SignUpForm(sessionMgr),
            SizedBox(height: 24),
            OrDivider(),
            SizedBox(height: 24),
            ContinueWithGooBook(),
            SizedBox(height: 24),
            _SwitchToLogin(sessionMgr),
          ],
        ),
      ),
    );
  }
}

class _SwitchToLogin extends StatelessWidget {
  final ClientSessionManager sessionMgr;

  const _SwitchToLogin(this.sessionMgr);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text("Do you have an account? "),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(builder: (_) => LoginPage(sessionMgr)),
            );
          },
          child: Text("Sign in", style: TextStyle(color: Color(0xFF1C64F2))),
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  final ClientSessionManager sessionMgr;

  const SignUpForm(this.sessionMgr, {super.key});

  @override
  State<SignUpForm> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        ActiveSession session = await widget.sessionMgr.signup(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
        toastification.show(
          type: .success,
          style: .fillColored,
          title: Text("Account created succesfully"),
        );
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  HomePage(session: session, sessionMgr: widget.sessionMgr),
            ),
          );
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
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          gappedWidgetStack(
            gap: 20,
            orientation: Axis.vertical,
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
              AuthTextFormField(
                validator: (input) => (input == null || input.isEmpty)
                    ? "Please enter a password"
                    : (input == passwordController.text)
                    ? null
                    : "Passwords do not match",
                controller: confirmPasswordController,
                icon: "assets/images/lock.svg",
                label: "Confirm Password",
                mustObscure: true,
              ),
            ],
          ),
          SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: submit,
              child: const Text("Create Account"),
            ),
          ),
        ],
      ),
    );
  }
}
