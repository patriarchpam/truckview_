import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/theme/theme_provider.dart';
import 'pages/splash.dart';
import 'pages/login.dart';
import 'pages/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vedgjwndvkbgupnrjsna.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlZGdqd25kdmtiZ3VwbnJqc25hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MDI5OTYsImV4cCI6MjEwMDM3ODk5Nn0.myN98rlr02tw5DkhDcaOKOVfoiYnUv4cxkLBj3abxuA',
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const TruckViewApp(),
    ),
  );
}

class TruckViewApp extends StatelessWidget {
  const TruckViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TruckView',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode, // Controlled by user, starts light
      home: const SplashPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}