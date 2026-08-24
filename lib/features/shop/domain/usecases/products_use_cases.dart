import 'package:digi_reto_2/features/shop/domain/entities/products.dart';
import 'package:digi_reto_2/features/shop/domain/repositories/products_repository.dart';

class ProductsUseCase {
  final ProductRepository _repository;

  ProductsUseCase(this._repository);

  Future<List<Product>> getProducts() async {
    return await _repository.getProducts();
  }

  Future<Product> getProduct(int id) async {
    return await _repository.getProduct(id);
  }
}
