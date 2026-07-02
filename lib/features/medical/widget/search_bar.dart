import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSearchBar extends StatelessWidget {
  final TextEditingController? controller;
	final void Function(String)? onChanged;

  const DoctorSearchBar({this.onChanged, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: .w400, height: 1.5, fontSize: 14),
			onChanged: onChanged,
      decoration: InputDecoration(
        prefixIconConstraints: .tightFor(width: 16 + 24 + 12, height: 24),
        prefixIcon: SvgPicture.asset("assets/images/search.svg"),
        filled: true,
        fillColor: Color(0xFFF3F4F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: .all(.circular(8)),
          borderSide: .none,
        ),
      ),
    );
  }
}
