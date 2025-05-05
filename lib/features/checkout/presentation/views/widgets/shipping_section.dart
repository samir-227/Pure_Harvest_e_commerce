import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

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
            price: '40 جنيه',
            isSelected: false),
        const SizedBox(height: 8),
        ShippingItem(
            title: S.of(context).payOnline,
            subtitle: S.of(context).PleaseSelectPaymentMethod,
            price: S.of(context).free,
            isSelected: true),
        const SizedBox(height: 100),
        
      ],
    );
  }
}
