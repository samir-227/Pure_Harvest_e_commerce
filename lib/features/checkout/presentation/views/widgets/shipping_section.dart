import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        ShippingItem(
            title: S.of(context).cashOnDelivery,
            subtitle: S.of(context).cod,
            price: context
                .read<OrderEntity>()
                .cartEntity
                .calculateTotalPrice()
                .toString(),
            isSelected: false),
        const SizedBox(height: 8),
        ShippingItem(
            title: S.of(context).payOnline,
            subtitle: S.of(context).PleaseSelectPaymentMethod,
            price: context
                .read<OrderEntity>()
                .cartEntity
                .calculateTotalPrice()
                .toString(),
            isSelected: true),
        const SizedBox(height: 100),
      ],
    );
  }
}
