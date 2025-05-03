import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity) {
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if (cartEntity.isExist(productEntity)) {
      cartItemEntity.incrementQuantity();
    } else {
      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartProductAdded());
  }

  void removeProduct(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartProductRemoved());
  }
}
