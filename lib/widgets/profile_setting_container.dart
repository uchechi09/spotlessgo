import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ProfileSettingsContainer extends StatelessWidget {
  const ProfileSettingsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            leading: Icon(
              Icons.notifications_none,
              size: 26,
              color: FlexColor.mandyRedDarkTertiary,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            leading: Icon(
              Icons.payment_outlined,
              size: 26,
              color: FlexColor.mandyRedDarkTertiary,
            ),
            title: Text(
              "Payment Methods",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            leading: Icon(
              Icons.location_on_outlined,
              size: 26,
              color: FlexColor.mandyRedDarkTertiary,
            ),
            title: Text(
              "Saved Addresses",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),
          Divider(),
          SizedBox(height: 12,),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            leading: Icon(
              Icons.help_outline,
              size: 26,
              color: FlexColor.mandyRedDarkTertiary,
            ),
            title: Text(
              "Help & Support",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward, size: 16),
          ),
        ],
      ),
    );
  }
}
// 