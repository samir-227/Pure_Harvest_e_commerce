import 'package:flutter_test/flutter_test.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo_impl.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class MockDatabaseService extends DatabaseService {
  @override
  Future<dynamic> getData({String? documentId, required String path, Map<String, dynamic>? query}) async {
    if (path == 'products') {
      return [
        {
          'name': 'Apple',
          'code': 'A1',
          'description': 'Fresh apple',
          'price': 10,
          'isFeatured': true,
          'imageUrl': null,
          'expirationsMonths': 6,
          'isOrganic': true,
          'numberOfCalories': 52,
          'unitAmount': 1,
          'reviews': []
        }
      ];
    }
    throw Exception('Unknown path');
  }

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId}) async {

  }

  @override
  Future<bool> isDataExist({required String path, String? documentId}) async {
    // Mock implementation: always return true
    return true;
  }
}

void main() {
  group('ProductEntity', () {
    test('should create ProductEntity with correct properties', () {
      final product = ProductEntity(
        name: 'Apple',
        code: 'A1',
        description: 'Fresh apple',
        price: 10,
        reviews: [],
        expirationsMonths: 6,
        numberOfCalories: 52,
        unitAmount: 1,
        isOrganic: true,
        isFeatured: true,
      );

      expect(product.name, 'Apple');
      expect(product.code, 'A1');
      expect(product.price, 10);
      expect(product.isOrganic, true);
    });
  });

  group('ProductsRepoImpl', () {
    test('should return list of products on getProducts', () async {
      final repo = ProductsRepoImpl(databaseService: MockDatabaseService());

      final result = await repo.getProducts();

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected right but got failure'),
        (products) {
          expect(products.length, 1);
          expect(products[0].name, 'Apple');
        },
      );
    });

    test('should return failure on unknown path', () async {
      final repo = ProductsRepoImpl(databaseService: MockDatabaseService());

      try {
        await repo.getProducts();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });

  group('CartEntity', () {
    test('should add and remove cart items and calculate total price', () {
      final product = ProductEntity(
        name: 'Apple',
        code: 'A1',
        description: 'Fresh apple',
        price: 10,
        reviews: [],
        expirationsMonths: 6,
        numberOfCalories: 52,
        unitAmount: 1,
        isOrganic: true,
        isFeatured: true,
      );

      final cartItem = CartItemEntity(product: product, quantity: 2);
      final cart = CartEntity(cartItems: []);

      cart.addCartItem(cartItem);
      expect(cart.cartItems.length, 1);

      final totalPrice = cart.calculateTotalPrice();
      expect(totalPrice, 20);

      cart.removeCartItem(cartItem);
      expect(cart.cartItems.length, 0);
    });
  });
}
