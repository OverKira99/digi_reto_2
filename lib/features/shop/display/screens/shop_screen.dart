import 'package:digi_reto_2/features/shop/display/providers/product_provider.dart';
import 'package:digi_reto_2/features/shop/display/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ProductProvider>();
      provider.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_cart,
                    size: 32,
                    color: Color(0xFF4F46E5),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SizedBox(
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            /* if (provider.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }*/
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: provider.products.length,
                itemBuilder: (_, index) {
                  return SizedBox(
                    height: 400,
                    child: ProductWidget(product: provider.products[index]),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
