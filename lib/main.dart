import 'package:flutter/material.dart';
import 'package:spotlessgo/models/user_role.dart';
import 'package:spotlessgo/pages/cleaner_verification_page.dart';
import 'package:spotlessgo/pages/login_page.dart';
import 'package:spotlessgo/pages/signup_page.dart';
import 'package:spotlessgo/pages/notifications_page.dart';
import 'package:spotlessgo/pages/onboarding_page.dart';
import 'package:spotlessgo/pages/welcome_page.dart';
import 'package:spotlessgo/pages/cleaner_service_selection_page.dart';
import 'package:spotlessgo/widgets/bottom_navigation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:spotlessgo/data/auth_provider.dart' as app_auth;
import 'package:spotlessgo/data/job_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => app_auth.AuthProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        "/cleanerhome": (context) =>
            const BottomNavigation(role: UserRole.cleaner),
        "/cleanerverification": (context) => CleanerVerificationPage(),
        "/cleanerserviceselection": (context) => CleanerServiceSelectionPage(),
      },
      initialRoute: "/onboarding",
    );
  }
}
