import 'package:digi_reto_2/features/shop/data/dto/product_dto.dart';
import 'package:digi_reto_2/features/shop/domain/entities/cart_item.dart';
import 'package:digi_reto_2/features/shop/domain/entities/product.dart';

class CartShopDto {
  final Product product;
  final int quantity;

  CartShopDto({required this.product, required this.quantity});

  factory CartShopDto.fromMap(Map<String, dynamic> map) => CartShopDto(
    product: ProductDto.fromMap(map).toEntity(),
    quantity: map['quantity'] ?? 0,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'image': product.image,
      'quantity': quantity,
    };
  }

  CartItem toEntity() => CartItem(product: product, quantity: quantity);

  factory CartShopDto.fromEntity(CartItem cartItem) =>
      CartShopDto(product: cartItem.product, quantity: cartItem.quantity);
}
