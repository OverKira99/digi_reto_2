import 'package:digi_reto_2/features/shop/domain/entities/cart_item.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int id);

  Future<void> saveProductCarShop(CartItem cartItem);

  Future<List<CartItem>> getProductCarShop();
}
