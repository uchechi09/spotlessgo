import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller, required this.label});
  final TextEditingController? controller;
  final String label;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool _hidePassword = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      label: widget.label,
      obscureText: _hidePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _hidePassword = !_hidePassword;
          });
        },
        icon: Icon(
          _hidePassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      ),
    );
  }
}
