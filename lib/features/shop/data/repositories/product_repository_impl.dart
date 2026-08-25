import 'package:digi_reto_2/features/shop/data/datasource/products_remote_datasource.dart';
import 'package:digi_reto_2/features/shop/data/dto/product_dto.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';
import 'package:digi_reto_2/features/shop/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

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
  Future<void> saveProductCarShop(Product product) async {
    return await _dataSource.saveProductCarShop(ProductDto.fromEntity(product));
  }
}
