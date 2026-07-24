import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/home.dart';
import 'package:truckview_mvp/pages/login.dart';
import 'pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://vedgjwndvkbgupnrjsna.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlZGdqd25kdmtiZ3VwbnJqc25hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MDI5OTYsImV4cCI6MjEwMDM3ODk5Nn0.myN98rlr02tw5DkhDcaOKOVfoiYnUv4cxkLBj3abxuA',
  );

  runApp(const TruckViewApp());
}

class TruckViewApp extends StatelessWidget {
  const TruckViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TruckView',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Switch based on system settings
      home: const SplashPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}