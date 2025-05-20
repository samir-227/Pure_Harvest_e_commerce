import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:hive/hive.dart';

part 'cart_item_entity.g.dart';

@HiveType(typeId: 2)
class CartItemEntity extends Equatable {
  @HiveField(0)
  final ProductEntity product;

  @HiveField(1)
  int quantity;

  CartItemEntity({required this.product, this.quantity = 0});

  num calculateTotalPrice() => product.price * quantity;
  num calculateTotalWeights() => product.unitAmount * quantity;

  int incrementQuantity() => quantity++;
  int decrementQuantity() => quantity--;

  @override
  List<Object?> get props => [product];
}
