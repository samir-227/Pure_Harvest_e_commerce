import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/best_selling_product/presentation/views/best_selling_product_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class BestSellerBar extends StatelessWidget {
  const BestSellerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(BestSellingProductView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).bestSeller,
            style: TextStyles.bold16,
          ),
          Text(
            S.of(context).more,
            style: TextStyles.regular13.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
