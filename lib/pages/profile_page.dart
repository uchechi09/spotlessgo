import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/profile_head_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.onBackPressed});

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeadContainer(onBackPressed: onBackPressed),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20
            ),
            ),
            
          ),
        )
      ],
    );
  }
}

