import 'package:digi_reto_2/features/shop/display/providers/product_provider.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopCarUpMenuWidget extends StatelessWidget {
  const ShopCarUpMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Product>(
      itemBuilder: (BuildContext context) {
        final listaProductos = context.read<ProductProvider>().products;
        return listaProductos.map((product) {
          return PopupMenuItem<Product>(
            value: product,
            child: ListTile(
              leading: Image.network(product.image),
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
            ),
          );
        }).toList();
      },
    );
  }
}
