import 'package:digi_reto_2/features/shop/data/models/add_product_cart_shop_model.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int id);

  Future<void> saveProductCarShop(ProductCartShopModel addProduct);
}
