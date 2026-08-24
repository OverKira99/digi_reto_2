import 'package:digi_reto_2/features/shop/domain/entities/products.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
}
