import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final gridItems = [
      {"title": "Bookings", "number": "12", "icon": Icons.calendar_today},
      {"title": "Ratings", "number": "4.8", "icon": Icons.star},
      {"title": "Hours Saved", "number": "48", "icon": Icons.access_time},
    ];

    return Positioned.fill(
      top: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return Card(
              elevation: 0,
              color: Colors.white.withAlpha(50),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"] as IconData,
                      size: 28,
                      color: Colors.white,
                    ),
                    SizedBox(height: 6),
                    Text(
                      item["number"] as String,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      item["title"] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
