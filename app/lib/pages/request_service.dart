import 'package:flutter/material.dart';
import 'booking_success.dart';

class RequestService extends StatefulWidget {
  const RequestService({super.key});

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleController = TextEditingController();
  final issueController = TextEditingController();

  String? selectedService;

  final List<String> services = [
    "Engine Repair",
    "Diagnostics",
    "Towing",
    "Battery Service",
    "Oil Change",
    "General Maintenance",
  ];

  bool isValidPhone(String phone) {
    return phone.length == 11;
  }

  void submitRequest() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        vehicleController.text.isEmpty ||
        issueController.text.isEmpty ||
        selectedService == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (!isValidPhone(phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number must be 11 digits")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingSuccessPage(
          name: nameController.text,
          service: selectedService!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Request Service",
                  style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [

              const Text(
                "Book a Service",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: vehicleController,
                decoration: const InputDecoration(
                  labelText: "Vehicle Type",
                  prefixIcon: Icon(Icons.car_repair),
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: selectedService,
                decoration: const InputDecoration(
                  labelText: "Select Service",
                ),
                items: services.map((service) {
                  return DropdownMenuItem(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedService = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              TextField(
                controller: issueController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Describe Issue",
                  alignLabelWithHint: true,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A00),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: submitRequest,
                  child: const Text("Submit Request"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}