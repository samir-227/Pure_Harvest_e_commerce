import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const routeName = '/CheckOutView';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Provider.value(
            value: OrderEntity(cartEntity: cartEntity, shippingAddress: ShippingAddressEntity()),
            child: const CheckOutViewBody()));
  }
}
