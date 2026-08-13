import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_colors.dart';

import 'home.dart';
import 'services.dart';
import 'request_service.dart';
import 'contact.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    ServicesPage(),
    RequestService(),
    ContactPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navBg = isDark ? AppColors.navDark : AppColors.brandNavy;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentIndex],
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: navBg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

          _buildNavItem(Icons.home, "Home", 0),
_buildNavItem(Icons.build, "Services", 1),

const SizedBox(width: 50),

_buildNavItem(Icons.contact_phone, "Contact", 3),
_buildNavItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.brandOrange,
        elevation: 8,
        child: const Icon(
    Icons.add,
    color: Colors.white,
    size: 32,
  ),
  onPressed: () {
    setState(() {
      currentIndex = 2;
    });
  },
),

floatingActionButtonLocation:
    FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.brandOrange.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: isActive ? 1.2 : 1.0,
              child: Icon(
                icon,
                color: isActive
                    ? AppColors.brandOrange
                    : Colors.white70,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive
                    ? AppColors.brandOrange
                    : Colors.white70,
                fontWeight:
                    isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}