import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: AppColors.brandNavy, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: isDark ? Colors.black26 : Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://cdn.magicpatterns.com/uploads/uesRGfbYRmZKB7thKWepJ2/image.png',
                          width: 210,
                          height: 137,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.brandOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.brandOrange.withOpacity(0.3)),
                      ),
                      child: const Text(
                        'ROADSIDE ASSISTANCE',
                        style: TextStyle(
                          color: AppColors.brandOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your satisfaction is\nour clarion call.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Professional repair and rescue support for every vehicle type.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}