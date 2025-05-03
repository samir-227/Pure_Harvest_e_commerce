import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_divider.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CartViewItem(
              cartItemEntity: cartItems[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const CustomDivider();
        });
  }
}

