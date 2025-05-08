import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_address_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            "${S.of(context).orderSummary} :",
            style: TextStyles.bold13.copyWith(color: colors.onSecondary),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: ShapeDecoration(
              color: colors.outline,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            child: OrderSummaryWidget(colors: colors),
            
          ),
          const SizedBox(
          height: 16,
        ),
        Container(
          decoration: ShapeDecoration(
              color: colors.outline,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          child: ShippingAddressWidget(
            pageController: pageController,
          ),
        ),
        ],
      ),
    );
  }
}

