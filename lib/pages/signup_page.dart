import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/models/user_role.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';
import 'package:spotlessgo/widgets/password_textfield.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';
import 'package:spotlessgo/widgets/social_signin.dart';

class SignupPage extends StatelessWidget {
  final UserRole role;

  const SignupPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final isCustomer = role == UserRole.customer;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120),
              // Role-based icon
              Icon(
                isCustomer ? Icons.home : Icons.work,
                size: 64,
                color: FlexColor.mandyRedLightTertiary,
              ),
              SizedBox(height: 20),
              //  Role-based title
              Text(
                "Let’s Get Started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: FlexColor.mandyRedLightTertiary,
                ),
              ),
              SizedBox(height: 8),
              // Role-based subtitle (VERY important)
              Text(
                isCustomer
                    ? "Create an account to book cleaning services"
                    : "Create an account to start accepting jobs",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    CustomTextField(label: "Full Name"),
                    SizedBox(height: 20),
                    CustomTextField(label: "Email"),
                    SizedBox(height: 20),
                    PasswordTextField(label: "Password"),
                    SizedBox(height: 20),
                    PasswordTextField(label: "Confirm Password"),
                    SizedBox(height: 24),
                    PrimaryCutomButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          isCustomer ? "/customerhome" : "/cleanerhome",
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    SocialSignIn(),
                    SizedBox(height: 16),
                    Text("Already have an account?"),
                    SizedBox(height: 12),
                    PrimaryCutomButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          isCustomer ? "/customerlogin" : "/cleanerlogin",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
