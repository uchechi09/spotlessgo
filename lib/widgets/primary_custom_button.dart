import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class PrimaryCutomButton extends StatelessWidget {
  const PrimaryCutomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: FlexColor.mandyRedDarkTertiary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(text),
      ),
    );
  }
}
