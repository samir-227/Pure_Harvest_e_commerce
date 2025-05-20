import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/data/datasources/cart_item_hive_datasource.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final CartItemHiveDataSource _hiveDataSource = CartItemHiveDataSource();

  CartItemCubit() : super(CartItemInitial());

  Future<void> fetchLocalProducts() async {
    final cartItems = await _hiveDataSource.getCartItems();
    if (cartItems.isNotEmpty) {
      emit(CartItemUpdated(cartItemEntity: cartItems.first));
    } else {
      emit(CartItemInitial());
    }
  }

  Future<void> updateCartItem(CartItemEntity cartItem) async {
    await _hiveDataSource.updateCartItem(cartItem);
    emit(CartItemUpdated(cartItemEntity: cartItem));
  }

  Future<void> addCartItem(CartItemEntity cartItem) async {
    await _hiveDataSource.addCartItem(cartItem);
    emit(CartItemUpdated(cartItemEntity: cartItem));
  }

  Future<void> deleteCartItem(String productCode) async {
    await _hiveDataSource.deleteCartItem(productCode);
    emit(CartItemInitial());
  }

  Future<void> clearCart() async {
    await _hiveDataSource.clearCart();
    emit(CartItemInitial());
  }
}
