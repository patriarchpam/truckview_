import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'package:truckview_mvp/widgets/brand_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Splash is always light — user cannot change theme before logging in
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Truck logo — local asset, no network needed
                    const BrandLogo(size: LogoSize.full),
                    const SizedBox(height: 36),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.brandOrange.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.brandOrange.withValues(alpha: 0.30)),
                      ),
                      child: const Text(
                        'ROADSIDE ASSISTANCE',
                        style: TextStyle(
                          color: AppColors.brandOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your satisfaction is\nour clarion call.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Professional repair and rescue support\nfor every vehicle type.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.mutedLight,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get started',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 20),
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