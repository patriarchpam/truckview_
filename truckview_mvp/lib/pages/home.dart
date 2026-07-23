import 'package:flutter/material.dart';
import 'services.dart';
import 'request_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            // 🔵 HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Your satisfaction is our clarion call",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔴 QUICK ACTION CTA (NEW — makes UI feel alive)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RequestService(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7A00),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [

                    Icon(Icons.flash_on, color: Colors.white, size: 30),

                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quick Request",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Tap to request a mechanic instantly",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              childAspectRatio: 1.1,

              children: [

                ServiceCard(
                  title: "Engine Repair",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ServicesPage(),
                      ),
                    );
                  }, desc: ' Full diagnostics & repair',
                ),

                ServiceCard(
                  title: "Diagnostics",
                  icon: Icons.car_repair,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  }, desc: ' Computer scanning & analysis',
                ),

                ServiceCard(
                  title: "Towing",
                  icon: Icons.local_shipping,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  }, desc: '24/7 emergency towing',
                ),

                ServiceCard(
                  title: "Battery",
                  icon: Icons.battery_charging_full,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  }, desc: 'Replacement & jumpstart',
                ),
              ],
            ),

            const SizedBox(height: 25),

            // 🟣 RECENT REQUESTS (NOW BETTER POSITIONED)
            const Text(
              "Recent Requests",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [

                      Icon(Icons.build_circle,
                          color: Color(0xFFFF7A00)),

                      SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Engine Inspection",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Pending • Today",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            // 🔴 EMERGENCY CARD (LAST — like real apps)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF7A00), Color(0xFFFF5A00)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [

                  Icon(
                    Icons.support_agent,
                    size: 45,
                    color: Colors.white,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Need Immediate Assistance?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Call or request help instantly anytime.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
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