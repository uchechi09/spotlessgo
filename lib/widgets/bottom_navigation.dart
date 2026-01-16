import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:spotlessgo/models/user_role.dart';
import '../pages/home_page.dart';
import '../pages/booking_page.dart';
import '../pages/profile_page.dart';
import '../pages/cleaner_home_page.dart';
import '../pages/cleaner_jobs_page.dart';
import '../pages/cleaner_earnings_page.dart';

class BottomNavigation extends StatefulWidget {
  final UserRole role;
  const BottomNavigation({super.key, this.role = UserRole.customer});

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
  late final List<BottomNavigationBarItem> navItems;

  @override
  void initState() {
    super.initState();
    if (widget.role == UserRole.customer) {
      pages = [
        HomePage(),
        BookingPage(),
        ProfilePage(onBackPressed: () => setState(() => indexToBeShown = 0)),
      ];
      navItems = [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined, size: 30),
          label: 'Bookings',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          label: 'Profile',
        ),
      ];
    } else {
      // Cleaner
      pages = [
        CleanerHomePage(),
        CleanerJobsPage(),
        CleanerEarningsPage(),
        ProfilePage(onBackPressed: () => setState(() => indexToBeShown = 0)),
      ];
      navItems = [
        const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined, size: 30),
          label: 'Dashboard',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.work_outline, size: 30),
          label: 'Jobs',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.attach_money_outlined, size: 30),
          label: 'Earnings',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          label: 'Profile',
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensure labels show for 4 items
        selectedItemColor: FlexColor.mandyRedLightTertiary,
        items: navItems,
      ),
    );
  }
}
