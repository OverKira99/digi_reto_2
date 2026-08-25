import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';
import 'package:digi_reto_2/features/shop/domain/repositories/product_repository.dart';

class ProductsUseCase {
  final ProductRepository _repository;

  ProductsUseCase(this._repository);

  Future<List<Product>> getProductsUseCase() async {
    return await _repository.getProducts();
  }

  Future<Product> getProductUseCase(int id) async {
    return await _repository.getProduct(id);
  }

  Future<void> saveProductCarShopUseCase(Product product) async {
    await _repository.saveProductCarShop(product);
  }
}
