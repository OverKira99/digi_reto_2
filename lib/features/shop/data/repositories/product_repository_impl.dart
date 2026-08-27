import 'dart:convert';

import 'package:digi_reto_2/features/shop/data/datasource/products_local_datasource.dart';
import 'package:digi_reto_2/features/shop/data/datasource/products_remote_datasource.dart';
import 'package:digi_reto_2/features/shop/data/dto/cart_shop_dto.dart';
import 'package:digi_reto_2/features/shop/domain/entities/cart_item.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product.dart';
import 'package:digi_reto_2/features/shop/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dataSource, this._productLocalDataSource);
  final ProductRemoteDataSource _dataSource;
  final ProductLocalDataSource _productLocalDataSource;

  @override
  Future<List<Product>> getProducts() async {
    return (await _dataSource.getProducts())
        .map((productDto) => productDto.toEntity())
        .toList();
  }

  @override
  Future<Product> getProduct(int id) async {
    return (await _dataSource.getProduct(id)).toEntity();
  }

  @override
  Future<void> saveProductCarShop(CartItem cartItem) async {
    await _productLocalDataSource.saveProductCarShop(
      CartShopDto.fromEntity(cartItem),
    );
  }

  @override
  Future<List<CartItem>> getProductCarShop() async {
    final stringList = await _productLocalDataSource.getProductCarShop();

    return stringList.map((itemString) {
      final Map<String, dynamic> map = jsonDecode(itemString);
      return CartShopDto.fromMap(map).toEntity();
    }).toList();
  }
}
