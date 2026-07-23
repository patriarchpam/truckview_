import 'package:flutter/material.dart';
import 'package:truckview_mvp/pages/home.dart';
import 'package:truckview_mvp/pages/login.dart';
import 'pages/splash.dart';

void main() {
  runApp(const TruckViewApp());
}

class TruckViewApp extends StatelessWidget {
  const TruckViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}