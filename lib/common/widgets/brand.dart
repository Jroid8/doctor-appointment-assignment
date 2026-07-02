import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/images/logo.svg", height: 66),
        SizedBox(height: 16),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Health',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              TextSpan(
                text: 'Pal',
                style: TextStyle(color: Color(0xFF111928)),
              ),
            ],
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
