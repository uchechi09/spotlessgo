import 'package:flutter/material.dart';
import 'package:spotlessgo/pages/customer_login_page.dart';
import 'package:spotlessgo/pages/customer_signup_page.dart';
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
        "/customer": (context) => CustomerLoginPage(),
        "/customersignup": (context) => CustomerSignupPage(),
        "/home": (context) => BottomNavigation(),
        "/notifications": (context) => NotificationsPage(),
   
      },
      initialRoute: "/onboarding",
    );
  }
}
