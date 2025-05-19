import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  Future<void> fetchLocalProducts() async {
  //  late CartItemEntity cartItem;
  //   await CacheHelper.getData(key: 'cartItem').then((value) {
  //     if (value != null) {
  //       cartItem = CartItemEntity.fromJson(value);
  //     }
  //   });
  //   updateCartItem(cartItem);
  }

  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdated(cartItemEntity: cartItem));
  }
}
