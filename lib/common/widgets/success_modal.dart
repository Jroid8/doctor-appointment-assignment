import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessModal extends StatelessWidget {
  final String message;
  final Widget child;

  const SuccessModal({required this.message, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: .only(left: 24, right: 24, top: 168, bottom: 232),
        padding: .symmetric(vertical: 32, horizontal: 48),
        decoration: BoxDecoration(
          borderRadius: .all(.circular(48)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SvgPicture.asset("assets/images/success.svg"),
            SizedBox(height: 32),
            Text(
              "Congratulations!",
              style: TextStyle(
                color: Color(0xFF1C2A3A),
                fontSize: 20,
                fontWeight: .w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              message,
              textAlign: .center,
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontWeight: .w400,
              ),
            ),
            SizedBox(height: 32),
            child,
          ],
        ),
      ),
    );
  }
}
