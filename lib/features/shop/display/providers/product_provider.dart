import 'package:digi_reto_2/features/shop/data/dto/product_dto.dart';
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

  Future<void> saveProduct(Product product) async {
    await _saveProductUseCase.saveProductCarShopUseCase(product);
    notifyListeners();
  }

  Future<Product> getProduct(int id) async {
    final product = await _getProductUseCase.getProductUseCase(id);
    return product;
  }

  Future<void> getProducts() async {
    products = await _getProductsUseCase.getProductsUseCase();
    notifyListeners();
  }
}
