import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum LogoSize { mini, compact, full }

class BrandLogo extends StatelessWidget {
  final LogoSize size;

  const BrandLogo({super.key, this.size = LogoSize.compact});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final double height = switch (size) {
      LogoSize.mini => 44,
      LogoSize.compact => 80,
      LogoSize.full => 140,
    };

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.brandNavy,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Image.asset(
        'assets/truck_logo.png',
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.local_shipping,
          size: 36,
          color: AppColors.brandNavy,
        ),
      ),
    );
  }
}
