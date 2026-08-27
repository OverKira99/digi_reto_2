import 'package:digi_reto_2/features/shop/domain/entities/cart_item.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product.dart';
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

  Future<void> saveProductCartShopUseCase(CartItem cartItem) async {
    return await _repository.saveProductCarShop(cartItem);
  }

  Future<List<CartItem>> getCartProductsUseCase() async {
    return await _repository.getProductCarShop();
  }
}
