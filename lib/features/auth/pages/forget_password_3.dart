import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/widgets/back_button.dart';
import 'package:doctor_appointment/common/widgets/brand.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/widgets/header.dart';
import 'package:doctor_appointment/features/auth/widgets/text_form_field.dart';
import 'package:doctor_appointment/utils/dio_error_message.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ForgetPasswordPage3 extends StatelessWidget {
  final AuthServerRepo authServer;
  final Uint8List resetToken;

  const ForgetPasswordPage3({
    required this.authServer,
    required this.resetToken,
    super.key,
  });

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
              "Create new password",
              "Your new password must be different form previously used password",
            ),
            _ForgetPasswordForm3(
              authServer: authServer,
              resetToken: resetToken,
            ),
          ],
        ),
      ),
    );
  }
}

class _ForgetPasswordForm3 extends StatefulWidget {
  final AuthServerRepo authServer;
  final Uint8List resetToken;

  const _ForgetPasswordForm3({
    required this.authServer,
    required this.resetToken,
  });

  @override
  State<_ForgetPasswordForm3> createState() => _ForgetPasswordForm3State();
}

class _ForgetPasswordForm3State extends State<_ForgetPasswordForm3> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await widget.authServer.completePasswordReset(
          widget.resetToken,
          passwordController.text,
        );
        if (!mounted) return;
        toastification.show(
          autoCloseDuration: Duration(seconds: 3),
          type: .success,
          style: .fillColored,
          title: Text("Password changed successfully"),
        );
        bool pwdResetP1Seen = false;
        Navigator.popUntil(context, (route) {
          if (pwdResetP1Seen) {
            return true;
          } else if (route.settings.name == "pwd-reset-p1") {
            pwdResetP1Seen = true;
          }
          return false;
        });
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
            controller: passwordController,
            icon: "assets/images/lock.svg",
            label: "Password",
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter a password"
                : null,
          ),
          SizedBox(height: 20),
          AuthTextFormField(
            controller: confirmPasswordController,
            icon: "assets/images/lock.svg",
            label: "Confirm Password",
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter a password"
                : (input == passwordController.text)
                ? null
                : "Passwords do not match",
          ),
          SizedBox(height: 32),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: submit,
              child: const Text("Reset Password"),
            ),
          ),
        ],
      ),
    );
  }
}
