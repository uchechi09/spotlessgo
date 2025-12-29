import 'package:flutter/material.dart';
import 'package:spotlessgo/models/user_role.dart';
import 'package:spotlessgo/pages/cleaner_verification_page.dart';
import 'package:spotlessgo/pages/login_page.dart';
import 'package:spotlessgo/pages/signup_page.dart';
import 'package:spotlessgo/pages/notifications_page.dart';
import 'package:spotlessgo/pages/onboarding_page.dart';
import 'package:spotlessgo/pages/welcome_page.dart';
import 'package:spotlessgo/widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpotlessGo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue.shade50,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade700),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/onboarding": (context) => OnboardingPage(),
        "/welcome": (context) => WelcomePage(),
        "/customer": (context) => LoginPage(role: UserRole.customer),
        "/cleaner": (context) => LoginPage(role: UserRole.cleaner),
        "/customerhome": (context) => BottomNavigation(),
        "/customersignup": (context) => SignupPage(role: UserRole.customer),
        "/cleanersignup": (context) => SignupPage(role: UserRole.cleaner),
        "/home": (context) => BottomNavigation(),
        "/notifications": (context) => NotificationsPage(),
       // "/cleanerhome": (context) => BottomNavigation(),
        "/cleanerverification": (context) => CleanerVerificationPage(),
        "/cleanerserviceselection": (context) => CleanerVerificationPage(),
      },
      initialRoute: "/onboarding",
    );
  }
}
