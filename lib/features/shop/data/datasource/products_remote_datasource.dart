import 'package:digi_reto_2/features/shop/domain/entities/products.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
  Future<void> saveProduct(Product product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<Map<String, dynamic>> _mockDatabase = [
    {'id': 1, 'name': 'Teclado Mecánico', 'price': 85.0},
    {'id': 2, 'name': 'Mouse Inalámbrico', 'price': 45.0},
    {'id': 3, 'name': 'Monitor 4K', 'price': 320.0},
  ];

  @override
  Future<Product> getProduct(int id) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    final item = _mockDatabase.firstWhere((item) => item['id'] == id);
    return Product.fromMap(item);
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    return _mockDatabase.map((item) => Product.fromMap(item)).toList();
  }

  @override
  Future<void> saveProduct(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    if (product.name.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    _mockDatabase.add(product.toMap());
  }
}
