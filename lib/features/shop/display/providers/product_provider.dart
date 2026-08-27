import 'package:digi_reto_2/features/shop/domain/entities/cart_item.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product.dart';
import 'package:digi_reto_2/features/shop/domain/usecases/product_use_cases.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final ProductsUseCase _saveProductUseCase;
  final ProductsUseCase _getProductUseCase;
  final ProductsUseCase _getProductsUseCase;

  ProductProvider({
    required this._saveProductUseCase,
    required this._getProductUseCase,
    required this._getProductsUseCase,
  });

  List<Product> products = [];
  List<CartItem> cartItems = [];
  bool isLoading = true;

  Future<void> getCartShop() async {
    cartItems = (await _getProductsUseCase.getCartProductsUseCase());
    notifyListeners();
  }

  Future<void> saveProductCartShop(Product product) async {
    await _saveProductUseCase.saveProductCartShopUseCase(
      CartItem(product: product, quantity: 1),
    );

    await getCartShop();
  }

  Future<Product> getProduct(int id) async {
    final product = await _getProductUseCase.getProductUseCase(id);
    return product;
  }

  Future<void> getProducts() async {
    products = (await _getProductsUseCase.getProductsUseCase());
    isLoading = false;
    notifyListeners();
  }
}
