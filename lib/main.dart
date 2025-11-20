
import 'package:flutter/material.dart';
import 'package:spotlessgo/pages/customer_login_page.dart';
import 'package:spotlessgo/pages/onboarding_page.dart';
import 'package:spotlessgo/pages/welcome_page.dart';

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
       "/onboarding": (context)=> OnboardingPage(),
       "/welcome": (context)=> WelcomePage(),
       "/customer": (context)=> CustomerLoginPage(),
     // home: const MyHomePage(title: 'SpotlessGo'),
  },
initialRoute: "/onboarding",
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      
      ), 
    );
  }
}