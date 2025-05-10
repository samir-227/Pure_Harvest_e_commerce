import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_divider.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            "المجموع الفرعي :",
            style: TextStyles.regular13.copyWith(color: colors.onSecondary),
          ),
          const Spacer(),
          Text(
           "${ context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه",
            style: TextStyles.semiBold16.copyWith(color: colors.onSecondary),
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              "التوصيل :",
              style: TextStyles.regular13.copyWith(color: colors.onSecondary),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                "${ context.read<OrderEntity>().calculateShippingPrice()} جنيه",
                style:
                    TextStyles.semiBold13.copyWith(color: colors.onSecondary),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: CustomDivider(),
        ),
        Row(
          children: [
            Text(
              " الكلي",
              style: TextStyles.bold16.copyWith(color: colors.onSecondary),
            ),
            const Spacer(),
            Text(
              "${ context.read<OrderEntity>().calculateTotalPriceAfterShippingAndDiscount()} جنيه",
              style: TextStyles.bold16.copyWith(color: colors.onSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
