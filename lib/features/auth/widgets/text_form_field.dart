import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final String? icon;
  final String label;
  final bool mustObscure;
  final TextInputType? inputType;

  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.onChanged,
    this.icon,
    this.mustObscure = false,
		this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIconConstraints: icon == null
            ? null
            : .tightFor(width: 18 + 16 + 8, height: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: .all(.circular(8)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        labelStyle: TextStyle(color: Colors.grey.shade400),
        prefixIcon: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: SvgPicture.asset(icon!),
              ),
        labelText: label,
      ),
			keyboardType: inputType,
      obscureText: mustObscure,
      enableSuggestions: !mustObscure,
      autocorrect: !mustObscure,
    );
  }
}
