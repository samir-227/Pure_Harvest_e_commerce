import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected});
  final String title, subtitle, price;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        color: colors.outline,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold13
                        .copyWith(color: colors.onSecondary),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyles.regular13
                        .copyWith(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                  child: Text(
                price,
                style: TextStyles.bold13.copyWith(color: colors.primary),
              )),
            ]),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFF949D9E)),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: colors.primary,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: colors.onPrimary),
        ),
      ),
    );
  }
}
