import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/custom_text_field.dart';
import 'package:spotlessgo/widgets/password_textfield.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';
import 'package:spotlessgo/widgets/social_signin.dart';

class CustomerSignupPage extends StatelessWidget {
  const CustomerSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Lets Get Started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: FlexColor.mandyRedLightTertiary,
                ),
              ),
              Text(
                "Create an account to continue with SpotlessGo",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 20,
                  children: [
                    //SizedBox(height: 16,),
                    CustomTextField(label: "Full Name"),
                    CustomTextField(label: "Email"),
                    CustomTextField(label: "Phone Number"),
                    PasswordTextField(label: "Password"),
                    PasswordTextField(label: "Confirm Password"),
                    PrimaryCutomButton(text: "Sign up", onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/home");  
                    }),
                    SocialSignIn(),

                    Text("Already have an account?"),

                    PrimaryCutomButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/customer");
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
