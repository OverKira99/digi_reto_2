import 'dart:convert';

import 'package:digi_reto_2/features/shop/data/dto/product_dto.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductDto>> getProducts();
  Future<ProductDto> getProduct(int id);
  Future<void> saveProductCarShop(ProductDto product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<Map<String, dynamic>> _mockDatabase = [
    {
      'id': 1,
      'name': 'Audifonos Inalambrico',
      'price': 85.0,
      'image': 'assets/images/audifonos.jpg',
    },
    {
      'id': 2,
      'name': 'Mouse Inalámbrico',
      'price': 45.0,
      'image': 'assets/images/mouse.jpg',
    },
    {
      'id': 3,
      'name': 'Monitor 4K',
      'price': 320.0,
      'image': 'assets/images/monitor.jpg',
    },
    {
      'id': 4,
      'name': 'Teclado Mecánico',
      'price': 85.0,
      'image': 'assets/images/teclado_mecanico.jpg',
    },
    {
      'id': 5,
      'name': 'Tablet',
      'price': 200.0,
      'image': 'assets/images/tablet.jpg',
    },
    {
      'id': 6,
      'name': 'Silla Gamer',
      'price': 150.0,
      'image': 'assets/images/silla_gamer.jpg',
    },
    {
      'id': 7,
      'name': 'Silla Gamer',
      'price': 150.0,
      'image': 'assets/images/silla_gamer.jpg',
    },
  ];

  @override
  Future<ProductDto> getProduct(int id) async {
    await Future.delayed(const Duration(milliseconds: 8000));
    final item = _mockDatabase.firstWhere((item) => item['id'] == id);
    return ProductDto.fromMap(item);
  }

  @override
  Future<List<ProductDto>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 8000));
    return _mockDatabase.map((item) => ProductDto.fromMap(item)).toList();
  }

  @override
  Future<void> saveProductCarShop(ProductDto productDto) async {
    await Future.delayed(const Duration(seconds: 1));
    final productJson = jsonEncode(productDto.toMap());
  }
}
