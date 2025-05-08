import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class Details extends Equatable {
  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  const Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromEntity(OrderEntity entity) => Details(
        subtotal: entity.cartEntity.calculateTotalPrice().toString(),
        shipping: entity.calculateShippingPrice().toString(),
        shippingDiscount: entity.calculateDiscount().toInt(),
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  @override
  List<Object?> get props => [subtotal, shipping, shippingDiscount];
}
