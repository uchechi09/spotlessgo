import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class HomeServicesCard extends StatelessWidget {
  const HomeServicesCard({
    super.key,

    required this.icon,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final String price;
  final IconData icon;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding:  EdgeInsets.all(8),
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      imagePath,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: FlexColor.mandyRedDarkTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.teal.withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: FlexColor.mandyRedDarkTertiary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
