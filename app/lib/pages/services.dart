import 'package:flutter/material.dart';
import 'package:truckview_mvp/pages/request_service.dart' show RequestService;
import 'package:truckview_mvp/widgets/service_card.dart';
import 'package:truckview_mvp/theme/app_colors.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final bgColor = isDark ? AppColors.pageDark : AppColors.softLight;
    final textColor = isDark ? AppColors.textDark : AppColors.textLight;

    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: isDark ? AppColors.pageDark : AppColors.brandNavy,
        elevation: 0,
        title: const Text(
          "Our Services",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What we offer",
              style: TextStyle(
                color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "TruckView Services",
              style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  serviceTapCard(
                    context,
                    title: "Engine Repair",
                    icon: Icons.engineering,
                    desc: "Full diagnostics & repair",
                  ),
                  serviceTapCard(
                    context,
                    title: "Vehicle Diagnosis",
                    icon: Icons.car_repair,
                    desc: "Computer scanning",
                  ),
                  serviceTapCard(
                    context,
                    title: "Towing Service",
                    icon: Icons.local_shipping,
                    desc: "24/7 emergency towing",
                  ),
                  serviceTapCard(
                    context,
                    title: "Battery Service",
                    icon: Icons.battery_charging_full,
                    desc: "Replacement & jumpstart",
                  ),
                  serviceTapCard(
                    context,
                    title: "Oil Change",
                    icon: Icons.oil_barrel,
                    desc: "Engine oil servicing",
                  ),
                  serviceTapCard(
                    context,
                    title: "General Maintenance",
                    icon: Icons.build_circle,
                    desc: "Full vehicle care",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget serviceTapCard(
  BuildContext context, {
  required String title,
  required IconData icon,
  required String desc,
}) {
  return ServiceCard(
    icon: icon,
    title: title,
    desc: desc, 
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RequestService(),
        ),
      );
    },
  );
}