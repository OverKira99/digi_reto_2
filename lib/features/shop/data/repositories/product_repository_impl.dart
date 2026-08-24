import 'package:digi_reto_2/features/shop/data/datasource/products_remote_datasource.dart';
import 'package:digi_reto_2/features/shop/domain/entities/products.dart';
import 'package:digi_reto_2/features/shop/domain/repositories/products_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

  @override
  Future<List<Product>> getProducts() async {
    return _dataSource.getProducts();
  }

  @override
  Future<Product> getProduct(int id) async {
    return _dataSource.getProduct(id);
  }

  @override
  Future<void> saveProduct(Product product) async {
    return _dataSource.saveProduct(product);
  }
}
