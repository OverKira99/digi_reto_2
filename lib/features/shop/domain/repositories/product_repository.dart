import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int id);

  Future<void> saveProductCarShop(Product product);
}
