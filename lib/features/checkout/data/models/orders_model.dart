import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrdersModel {
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final double totalPrice;
  final String uid;
  final String paymentMethod;
  final String orderId ;

  OrdersModel( {
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.totalPrice,
    required this.uid,
    required this.paymentMethod,
  });
  factory OrdersModel.fromEntity(OrderEntity ordersEntity) => OrdersModel(
        orderId:const Uuid().v4(),
        shippingAddressModel:
            ShippingAddressModel.fromEntity(ordersEntity.shippingAddress),
        orderProducts: ordersEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(e))
            .toList(),
        totalPrice: ordersEntity.cartEntity.calculateTotalPrice(),
        uid: ordersEntity.uid,
        paymentMethod: ordersEntity.payWithCash! ? 'Cash' : 'Online',
      );
  toJson() => {
        'status': 'pending',
        'orderId': orderId,
        'date': DateTime.now().toString(),
        'shippingAddress': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'uid': uid,
        'paymentMethod': paymentMethod,
      };
}
