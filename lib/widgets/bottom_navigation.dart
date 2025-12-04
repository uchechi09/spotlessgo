import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import '../pages/home_page.dart';
import '../pages/booking_page.dart';
import '../pages/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 0;

  void onItemTapped(int index) {
    setState(() {
      indexToBeShown = index;
    });
  }

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      BookingPage(),
      ProfilePage(onBackPressed: () => setState(() => indexToBeShown = 0)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: onItemTapped,
        selectedItemColor: FlexColor.mandyRedLightTertiary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined, size: 40),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 40),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
