import 'dart:convert';

import 'package:digi_reto_2/features/shop/data/dto/cart_shop_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<String>> saveProductCarShop(CartShopDto cartModel);
  Future<List<String>> getProductCarShop();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences _sharedPreferences;
  ProductLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<String>> saveProductCarShop(CartShopDto cartModel) async {
    final currentCart = _sharedPreferences.getStringList("cart_shop") ?? [];

    for (int i = 0; i < currentCart.length; i++) {
      final Map<String, dynamic> map = jsonDecode(currentCart[i]);
      final CartShopDto currentProductDto = CartShopDto.fromMap(map);

      if (currentProductDto.product.id == cartModel.product.id) {
        final updatedCart = currentProductDto.quantity + cartModel.quantity;

        final updateDto = CartShopDto(
          product: currentProductDto.product,
          quantity: updatedCart,
        );

        currentCart[i] = jsonEncode(updateDto.toMap());
        await _sharedPreferences.setStringList("cart_shop", currentCart);
        return currentCart;
      }
    }

    currentCart.add(jsonEncode(cartModel.toMap()));
    await _sharedPreferences.setStringList("cart_shop", currentCart);
    return currentCart;
  }

  @override
  Future<List<String>> getProductCarShop() async {
    return _sharedPreferences.getStringList("cart_shop") ?? [];
  }
}
