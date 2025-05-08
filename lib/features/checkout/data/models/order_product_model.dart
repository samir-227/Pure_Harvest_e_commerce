import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String code;
  final String name;
  final String image;
  final String quantity;
  final String price;
  OrderProductModel({
    required this.code,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });
  factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
      code: cartItemEntity.product.code,
      name: cartItemEntity.product.name,
      image: cartItemEntity.product.imageUrl!,
      quantity: cartItemEntity.quantity.toString(),
      price: cartItemEntity.product.price.toString(),
    );
  }
  toJson() => {
        "code": code,
        "name": name,
        "image": image,
        "quantity": quantity,
        "price": price
      };
}
