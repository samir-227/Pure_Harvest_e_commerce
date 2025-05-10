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
  double calculateShippingPrice() {
    if (payWithCash == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateDiscount() {
    return 0;
  }

  int calculateTotalPriceAfterShippingAndDiscount() {
    return (cartEntity.calculateTotalPrice() +
        calculateShippingPrice() -
        calculateDiscount()).toInt();
  }

}
