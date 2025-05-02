import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffEBF9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text('لديك 3 منتجات في سله التسوق',
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
    );
  }
}
