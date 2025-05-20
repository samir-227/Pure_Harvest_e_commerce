import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/data/datasources/cart_item_hive_datasource.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartItemHiveDataSource _hiveDataSource = CartItemHiveDataSource();

  CartEntity cartEntity = CartEntity(cartItems: []);

  CartCubit() : super(CartInitial()) {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final cartItems = await _hiveDataSource.getCartItems();
    cartEntity = CartEntity(cartItems: cartItems);
    emit(CartLoaded(cartEntity: cartEntity));
  }

  Future<void> addProduct(ProductEntity productEntity) async {
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if (cartEntity.isExist(productEntity)) {
      cartItemEntity.incrementQuantity();
      await _hiveDataSource.updateCartItem(cartItemEntity);
    } else {
      cartEntity.addCartItem(cartItemEntity);
      await _hiveDataSource.addCartItem(cartItemEntity);
    }
    emit(CartLoaded(cartEntity: cartEntity));
  }

  Future<void> removeProduct(CartItemEntity cartItemEntity) async {
    cartEntity.removeCartItem(cartItemEntity);
    await _hiveDataSource.deleteCartItem(cartItemEntity.product.code);
    emit(CartProductRemoved());
  }
}
