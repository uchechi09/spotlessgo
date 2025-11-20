import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/primary_custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: FlexColor.mandyRedLightTertiary,
                ),
                child: Icon(
                  CupertinoIcons.sparkles,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "SpotlessGo",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: FlexColor.mandyRedLightTertiary,
              ),
            ),
            Text(
              "Cleaning made simple",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            _buildFeatureItem(
              icon: CupertinoIcons.sparkles,
              title: "Professional Cleaners",
              subtitle: "Verified and trained cleaners at your\nservice",
              color: FlexColor.mandyRedLightTertiary,
            ),
            _buildFeatureItem(
              icon: CupertinoIcons.clock,
              title: "Fast & Flexible",
              subtitle: "Schedule cleanings on your time",
              color: Colors.pinkAccent,
            ),
            _buildFeatureItem(
              icon: CupertinoIcons.shield_lefthalf_fill,
              title: "Safe & Secure",
              subtitle: "Your safety and privacy are\nguaranteed",
              color: Colors.blueAccent,
            ),
            SizedBox(height: 16),
            PrimaryCutomButton(text: "Get Started",
             onPressed: () {
          Navigator.of(context).pushNamed("/welcome");
        },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [BoxShadow(blurRadius: 8)],
          ),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(subtitle, style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}

