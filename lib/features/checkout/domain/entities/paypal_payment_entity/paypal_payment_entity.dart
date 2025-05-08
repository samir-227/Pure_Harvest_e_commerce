import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity extends Equatable {
  final Amount? amount;
  final String? description;
  final ItemList? itemList;

  const PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity order) =>
      PaypalPaymentEntity(
        amount: Amount.fromEntity(order),
        description: 'Payment description',
        itemList: ItemList.fromEntity(items:  order.cartEntity.cartItems),
      );

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };

  @override
  List<Object?> get props => [amount, description, itemList];
}
