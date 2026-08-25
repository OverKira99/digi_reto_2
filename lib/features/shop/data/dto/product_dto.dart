import 'package:digi_reto_2/features/shop/domain/entities/product_entity.dart';

class ProductDto {
  final Product product;

  ProductDto({required this.product});

  Product toEntity() => Product(
    id: product.id,
    name: product.name,
    price: product.price,
    image: product.image,
  );

  factory ProductDto.fromEntity(Product product) =>
      ProductDto(product: product);

  factory ProductDto.fromMap(Map<String, dynamic> map) => ProductDto(
    product: Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
    ),
  );

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'image': product.image,
    };
  }
}
