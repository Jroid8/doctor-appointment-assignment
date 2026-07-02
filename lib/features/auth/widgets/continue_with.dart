import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return _ContinueWith("Google", "assets/images/google.svg");
  }
}

class ContinueWithFacebook extends StatelessWidget {
  const ContinueWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return _ContinueWith("Facebook", "assets/images/facebook.svg");
  }
}

class _ContinueWith extends StatelessWidget {
  final String icon;
  final String name;

  const _ContinueWith(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.grey.shade200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: .symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 8, height: 0),
            Text("Continue with $name", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class ContinueWithGooBook extends StatelessWidget {
  const ContinueWithGooBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContinueWithGoogle(),
        SizedBox(height: 9),
        ContinueWithFacebook(),
      ],
    );
  }
}

