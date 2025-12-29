import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                "SpotlessGo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: FlexColor.mandyRedLightTertiary,
                ),
              ),
              Text(
                "Select your role to continue",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 50),
              _buildHomeButton(
                icon: Icons.people_alt_outlined,
                title: "Customer?",
                subtitle: "Book cleaning services for your home and office",
                onTap: () {
                  Navigator.pushNamed(context, "/customer");
                },
              ),
              SizedBox(height: 20),
              _buildHomeButton(
                icon: Icons.cleaning_services_outlined,
                title: "Cleaner?",
                subtitle: "Accept jobs and earn money on your schedule",
                onTap: () {
                  Navigator.pushNamed(context, "/cleaner");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.shade400,
              )
            ),
            child: Row(
              spacing: 12,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlexColor.mandyRedDarkTertiary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(icon, color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(subtitle, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
