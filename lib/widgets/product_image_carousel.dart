// lib/widgets/product_image_carousel.dart
import 'package:flutter/material.dart';

import '../models/iphones.dart';

class ProductImageCarousel extends StatelessWidget {
  final Iphone iphone;

  const ProductImageCarousel({super.key, required this.iphone});

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.network(
                iphone.imageUrl,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'iPhone 15 128GB\n256GB 512GB',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildColorCircle(Colors.black),
                          _buildColorCircle(Colors.white),
                          _buildColorCircle(Colors.blue[100]!),
                          _buildColorCircle(Colors.yellow[100]!),
                          _buildColorCircle(Colors.pink[100]!),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
