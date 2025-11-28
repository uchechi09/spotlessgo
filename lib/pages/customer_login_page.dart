import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';
import 'package:spotlessgo/widgets/password_textfield.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';
import 'package:spotlessgo/widgets/social_signin.dart';

class CustomerLoginPage extends StatelessWidget {
  const CustomerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
              SizedBox(height: 8),
              Text(
                "Sign in to continue with SpotlessGo",
                style: TextStyle(fontSize: 16),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomTextField(label: "Email"),
                    SizedBox(height: 20),
                    PasswordTextField(label: "Password"),

                    SizedBox(height: 20),
                    PrimaryCutomButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.of(context).pushNamed("/home");
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

                    SizedBox(height: 20),
                    SocialSignIn(),

                    SizedBox(height: 12),
                    Text("Don't have an account yet?"),

                    SizedBox(height: 16),
                    PrimaryCutomButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.of(context).pushNamed("/customersignup");
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
