import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';
import 'package:spotlessgo/widgets/password_textfield.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';

class CustomerLoginPage extends StatelessWidget {
  const CustomerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 8,
          children: [
            SizedBox(height: 200),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: FlexColor.mandyRedLightTertiary,
              ),
            ),
            Text("Sign in to continue with SpotlessGo"),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 20,
                children: [
                  CustomTextField(label: "Email"),
                  PasswordTextField(),

                  PrimaryCutomButton(text: "Sign In", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
