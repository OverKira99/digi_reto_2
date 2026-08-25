import 'package:digi_reto_2/features/shop/data/models/add_product_cart_shop_model.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';
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
  bool isLoading = true;

  Future<void> saveProductCarShop(Product product) async {
    await _saveProductUseCase.saveProductCarShopUseCase(
      addProduct: ProductCartShopModel(
        product: product,
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
      ),
    );
    notifyListeners();
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
