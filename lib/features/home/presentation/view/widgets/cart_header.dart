import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.outline,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
            "${context.watch<CartCubit>().cartEntity.cartItems.length} ${S.of(context).cartProductsNumber}",
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(
              color: colors.primary,
            )),
      ),
    );
  }
}
