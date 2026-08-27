import 'package:digi_reto_2/features/shop/domain/entities/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 0});
}
