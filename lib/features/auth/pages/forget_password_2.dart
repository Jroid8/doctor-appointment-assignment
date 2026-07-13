import 'dart:math';

import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/widgets/back_button.dart';
import 'package:doctor_appointment/common/widgets/brand.dart';
import 'package:doctor_appointment/features/auth/pages/forget_password_3.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/widgets/header.dart';
import 'package:doctor_appointment/utils/dio_error_message.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

class ForgetPasswordPage2 extends StatelessWidget {
  final AuthServerRepo authServer;
  final String email;

  const ForgetPasswordPage2({
    required this.authServer,
    required this.email,
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
              "Verify Code",
              "Enter the the code we just sent you on your registered Email",
            ),
            _ForgetPasswordForm2(authServer: authServer, email: email),
            _ResendCode(),
          ],
        ),
      ),
    );
  }
}

class _ResendCode extends StatelessWidget {
  const _ResendCode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Didn’t get the Code? "),
        InkWell(
          onTap: () {},
          child: Text("Resend", style: TextStyle(color: Color(0xFF1C64F2))),
        ),
      ],
    );
  }
}

class _ForgetPasswordForm2 extends StatefulWidget {
  final AuthServerRepo authServer;
  final String email;

  const _ForgetPasswordForm2({required this.authServer, required this.email});

  @override
  State<_ForgetPasswordForm2> createState() => _ForgetPasswordForm2State();
}

class _ForgetPasswordForm2State extends State<_ForgetPasswordForm2> {
  final PwdResetCodeInputsCtrlr pwdResetCodeInputsController =
      PwdResetCodeInputsCtrlr();

  void submit() async {
    try {
      Uint8List? resetToken = await widget.authServer.verifyPasswordResetCode(
        widget.email,
        pwdResetCodeInputsController.code,
      );
      if (resetToken == null) {
        toastification.show(
          autoCloseDuration: Duration(seconds: 3),
          type: .error,
          style: .fillColored,
          title: Text("Invalid code"),
        );
      } else {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => ForgetPasswordPage3(
              authServer: widget.authServer,
              resetToken: resetToken,
            ),
          ),
        );
      }
    } catch (e) {
      String message = e is DioException ? dioErrorMessage(e) : e.toString();
      toastification.show(
        autoCloseDuration: Duration(seconds: 3),
        type: .error,
        style: .fillColored,
        title: Text("Password reset request failed"),
        description: Text(message),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        PwdResetCodeInputs(pwdResetCodeInputsController),
        SizedBox(height: 32),
        SizedBox(
          height: 48,
          child: FilledButton(onPressed: submit, child: const Text("Verify")),
        ),
      ],
    );
  }
}

const int digits = 5;

class PwdResetCodeInputsCtrlr {
  final List<TextEditingController> _controllers = List.generate(
    digits,
    (_) => TextEditingController(),
  );

  TextEditingController digitController(int index) => _controllers[index];

  int get code {
    int c = 0;
    for (int i = 0; i < digits; i++) {
      int d = int.parse(_controllers[i].text);
      c += pow(10, digits - i - 1) * d as int;
    }
    return c;
  }
}

class PwdResetCodeInputs extends StatefulWidget {
  final PwdResetCodeInputsCtrlr controller;

  const PwdResetCodeInputs(this.controller, {super.key});

  @override
  State<PwdResetCodeInputs> createState() => _PwdResetCodeInputsState();
}

class _PwdResetCodeInputsState extends State<PwdResetCodeInputs> {
  @override
  Widget build(BuildContext context) {
    return gappedWidgetStack(
      gap: 16,
      orientation: Axis.horizontal,
      children: List.generate(
        digits,
        (i) => SizedBox(
          width: 56,
          child: PwdResetCodeDigit(
            controller: widget.controller.digitController(i),
          ),
        ),
      ),
    );
  }
}

class PwdResetCodeDigit extends StatelessWidget {
  final TextEditingController controller;

  const PwdResetCodeDigit({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: .number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: .all(.circular(12)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      style: TextStyle(fontSize: 21), // derived from trial and error
      textAlign: .center,
    );
  }
}
