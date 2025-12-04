import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ProfileHeadContainer extends StatelessWidget {
  const ProfileHeadContainer({
    super.key,
    required this.onBackPressed,
  });

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: FlexColor.mandyRedDarkTertiary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(50),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBackPressed,
                ),
              ),
              Expanded(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image: load safely with a fallback if asset is missing
              Container(
                width: 90,
                height: 90,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //border: Border.all(color: Colors.white, width: 3),
                  color: Colors.grey,
                ),
                child: Image.asset(
                  'assets/images/profile.jpeg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grace',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'grace@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
