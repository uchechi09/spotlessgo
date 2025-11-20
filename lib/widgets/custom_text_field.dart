import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,

        suffixIcon: suffixIcon, 

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        labelText: label,
      ),
    );
  }
}
