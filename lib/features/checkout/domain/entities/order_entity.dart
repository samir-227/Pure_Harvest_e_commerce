import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
   bool? payWithCash;
   ShippingAddressEntity shippingAddress ;

  OrderEntity(
      {required this.cartEntity, this.payWithCash,required this.shippingAddress});
}
