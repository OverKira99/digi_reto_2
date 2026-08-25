import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'ShopSwift',
                  style: TextStyle(
                    color: Color(0xFF4F46E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.shopping_bag, size: 32, color: Color(0xFF4F46E5)),
                SizedBox(width: 200),
                Icon(Icons.shopping_cart, size: 32, color: Color(0xFF4F46E5)),
                SizedBox(width: 16),
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: const Center(child: Text('Tienda')),
    );
  }
}
