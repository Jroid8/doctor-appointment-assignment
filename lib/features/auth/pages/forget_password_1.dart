import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/widgets/brand.dart';
import 'package:doctor_appointment/common/widgets/back_button.dart';
import 'package:doctor_appointment/features/auth/pages/forget_password_2.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/utils/email_validator.dart';
import 'package:doctor_appointment/features/auth/widgets/header.dart';
import 'package:doctor_appointment/features/auth/widgets/text_form_field.dart';
import 'package:doctor_appointment/utils/dio_error_message.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ForgetPasswordPage1 extends StatelessWidget {
  final AuthServerRepo authServer;

  const ForgetPasswordPage1(this.authServer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			resizeToAvoidBottomInset: false,
      body: Padding(
        padding: .symmetric(vertical: 32, horizontal: 24),
        child: gappedWidgetStack(
          gap: 32,
          orientation: Axis.vertical,
          children: [
            Row(children: [MyBackButton()]),
            Brand(),
            AuthHeader(
              "Forgot Password?",
              "Enter your Email, we will send you a verification code.",
            ),
            _ForgetPasswordForm(authServer),
          ],
        ),
      ),
    );
  }
}

class _ForgetPasswordForm extends StatefulWidget {
  final AuthServerRepo authServer;

  const _ForgetPasswordForm(this.authServer);

  @override
  State<_ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<_ForgetPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        String email = emailController.text;
        await widget.authServer.requestResetPassword(email);
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => ForgetPasswordPage2(
              authServer: widget.authServer,
              email: email,
            ),
          ),
        );
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
          AuthTextFormField(
            controller: emailController,
            icon: "assets/images/mail.svg",
            label: "Your Email",
            validator: EmailValidator.validate,
          ),
          SizedBox(height: 32),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: submit,
              child: const Text("Send Code"),
            ),
          ),
        ],
      ),
    );
  }
}
