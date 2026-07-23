import 'package:flutter/material.dart';
import 'package:truckview_mvp/pages/request_service.dart' show RequestService;

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
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

            const Text(
              "What we offer",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "TruckView Services",
              style: TextStyle(
                color: Colors.white,
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
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RequestService(),
        ),
      );
    },
    child: ServiceCard(
      icon: icon,
      title: title,
      desc: desc, onTap: () {  },
    ),
  );
}
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7A00).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF7A00),
              size: 26,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            desc,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}