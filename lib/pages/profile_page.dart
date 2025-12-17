import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/profile_head_container.dart';
import 'package:spotlessgo/widgets/profile_section_first_container.dart';
import 'package:spotlessgo/widgets/profile_setting_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.onBackPressed});

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeadContainer(onBackPressed: onBackPressed),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(14),
              child: ProfileSectionFirstContainer(),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: ProfileSettingsContainer(),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade200,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140,
                    vertical: 20,
                  ),
                ),
                icon: Icon(Icons.logout, size: 20),
                label: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
