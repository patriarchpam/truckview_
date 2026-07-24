import 'package:flutter/material.dart';
import 'home.dart';

class BookingSuccessPage extends StatelessWidget {
  final String name;
  final String service;

  const BookingSuccessPage({
    super.key,
    required this.name,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),

              const SizedBox(height: 15),

              const Text(
                "Booking Successful!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Hello $name,\nYour request for '$service' has been received.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              const Text(
                "TruckView will contact you shortly 🚛",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A00),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text("Back to Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}