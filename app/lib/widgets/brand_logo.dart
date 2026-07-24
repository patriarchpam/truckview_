import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double width;
  final double height;

  const BrandLogo({super.key, this.width = 140, this.height = 90});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF0A1F44), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          'https://cdn.magicpatterns.com/uploads/uesRGfbYRmZKB7thKWepJ2/image.png',
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.local_shipping,
            size: 40,
            color: Color(0xFF0A1F44),
          ),
        ),
      ),
    );
  }
}
