import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        CartItemActionsButton(
            onTap: () {
              cartItemEntity.incrementQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            backgroundColor: colors.primary,
            iconColor: colors.onPrimary,
            icon: Icons.add),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("${cartItemEntity.quantity}", style: TextStyles.bold16),
        ),
        CartItemActionsButton(
            onTap: () {
              cartItemEntity.decrementQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            backgroundColor: colors.outline,
            iconColor: colors.onSurfaceVariant,
            icon: Icons.remove),
      ],
    );
  }
}

class CartItemActionsButton extends StatelessWidget {
  const CartItemActionsButton(
      {super.key,
      required this.backgroundColor,
      required this.iconColor,
      required this.icon,
      this.onTap});
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: backgroundColor,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
