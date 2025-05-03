import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int quantity;
  CartItemEntity({required this.product, this.quantity = 0});
  num calculateTotalPrice() => product.price * quantity;
  num calculateTotalWeights() => product.unitAmount * quantity;

  int incrementQuantity() => quantity++;
  int decrementQuantity() => quantity--;

  @override
  List<Object?> get props => [product];
}
