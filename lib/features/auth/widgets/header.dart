import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextTheme.of(context).headlineLarge),
        SizedBox(height: 8, width: 0),
        Text(subtitle, textAlign: .center),
      ],
    );
  }
}
