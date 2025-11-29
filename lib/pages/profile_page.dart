import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Return plain content (no Scaffold or AppBar) so this can be
    // used as a child page inside the app's root Scaffold.
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FlexColor.mandyRedDarkTertiary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
