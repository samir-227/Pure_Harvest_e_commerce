import 'package:fruits_hub/core/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartItemHiveDataSource {


  static Box<CartItemEntity>? _box;

  // Singleton pattern: private constructor
  CartItemHiveDataSource._privateConstructor();

  static final CartItemHiveDataSource _instance = CartItemHiveDataSource._privateConstructor();

  factory CartItemHiveDataSource() {
    return _instance;
  }

  // Initialization guard to open the box only once
  Future<Box<CartItemEntity>> _openBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<CartItemEntity>(kCartBoxName);
    }
    return _box!;
  }

  Future<List<CartItemEntity>> getCartItems() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addCartItem(CartItemEntity item) async {
    final box = await _openBox();
    await box.put(item.product.code, item);
  }

  Future<void> updateCartItem(CartItemEntity item) async {
    final box = await _openBox();
    await box.put(item.product.code, item);
  }

  Future<void> deleteCartItem(String productCode) async {
    final box = await _openBox();
    await box.delete(productCode);
  }

  Future<void> clearCart() async {
    final box = await _openBox();
    await box.clear();
  }
}
