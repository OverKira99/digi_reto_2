import 'dart:convert';

import 'package:digi_reto_2/features/shop/data/dto/product_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<String>> saveProductCarShop(ProductDto cartModel);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences _sharedPreferences;
  ProductLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<String>> saveProductCarShop(ProductDto productDto) async {
    final currentCart = _sharedPreferences.getStringList("cart_shop") ?? [];
    currentCart.add(jsonEncode(productDto.toMap()));
    await _sharedPreferences.setStringList("cart_shop", currentCart);
    return currentCart;
  }
}
