import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';

class ProductCartShopModel {
  final Product product;
  final int id;
  final String name;
  final double price;
  final String image;

  ProductCartShopModel({
    required this.product,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}
