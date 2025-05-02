import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;
  CartItemEntity({required this.product, this.count = 0});
  num calculateTotalPrice() => product.price * count;
  num calculateTotalWeights() => product.unitAmount * count;
  
  incrementCount() => count++;
  decrementCount() => count--;
}