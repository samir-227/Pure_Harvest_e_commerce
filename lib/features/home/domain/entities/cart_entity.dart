import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartEntity  {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) => cartItems.add(cartItemEntity);
  removeCartItem(CartItemEntity cartItemEntity) =>
      cartItems.remove(cartItemEntity);

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartEntity in cartItems) {
      if (cartEntity.product == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var cartEntity in cartItems) {
      if (cartEntity.product == productEntity) {
        return cartEntity;
      }
    }
    return CartItemEntity(product: productEntity, quantity: 1);
  }

 
}
