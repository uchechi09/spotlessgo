import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/models/user_role.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';
import 'package:spotlessgo/widgets/password_textfield.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';
import 'package:spotlessgo/widgets/social_signin.dart';

class LoginPage extends StatelessWidget {
  final UserRole role;

  const LoginPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final isCustomer = role == UserRole.customer;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 160),

              //Role-based icon
              Icon(
                isCustomer ? Icons.home : Icons.work,
                size: 64,
                color: FlexColor.mandyRedLightTertiary,
              ),
              SizedBox(height: 20),
              // Role-based title
              Text(
                isCustomer ? "Welcome Back" : "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: FlexColor.mandyRedLightTertiary,
                ),
              ),
              SizedBox(height: 8),
              // Role-based subtitle (THIS MATTERS)
              Text(
                isCustomer
                    ? "Sign in to book a cleaning service"
                    : "Sign in to manage your cleaning jobs",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 24),

                    CustomTextField(label: "Email"),
                    SizedBox(height: 20),
                    PasswordTextField(label: "Password"),
                    SizedBox(height: 24),
                    PrimaryCutomButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          isCustomer ? "/customerhome" : "/cleanerserviceselection",
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: FlexColor.mandyRedDarkTertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SocialSignIn(),
                    SizedBox(height: 16),
                    Text(
                      isCustomer ? "Don't have an account yet?" : "New here?",
                    ),
                    SizedBox(height: 16),
                    PrimaryCutomButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          isCustomer ? "/customersignup" : "/cleanersignup",
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
