import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final String uid;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity( 
      {required this.cartEntity,
      required this.uid,
      this.payWithCash,
      required this.shippingAddress});
}
