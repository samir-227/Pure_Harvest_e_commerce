import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var oderEntity = context.watch<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 32),
        ShippingItem(
            onTap: () {
              setState(() {
                currentIndex = 0;
                oderEntity.payWithCash = true;
              });
            },
            title: S.of(context).cashOnDelivery,
            subtitle: S.of(context).cod,
            price:
                (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                        30)
                    .toString(),
            isSelected: currentIndex == 0),
        const SizedBox(height: 8),
        ShippingItem(
            onTap: () {
              setState(() {
                currentIndex = 1;
                oderEntity.payWithCash = false;
              });
            },
            title: S.of(context).payOnline,
            subtitle: S.of(context).PleaseSelectPaymentMethod,
            price: context
                .read<OrderEntity>()
                .cartEntity
                .calculateTotalPrice()
                .toString(),
            isSelected: currentIndex == 1),
        const SizedBox(height: 100),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
