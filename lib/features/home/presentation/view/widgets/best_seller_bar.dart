import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BestSellerBar extends StatelessWidget {
  const BestSellerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).bestSeller,
          style: TextStyles.bold16,
        ),
        Text(
          S.of(context).more,
          style: TextStyles.regular13.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,),
        ),

      ],
    );
  }
}