import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_actions_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({super.key, required this.cartItemEntity});
 final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            color: colors.outline,
            width: 73,
            height: 90,
            child: CustomNetworkImage(imageUrl: cartItemEntity.product.imageUrl! ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        cartItemEntity.product.name,
                        style: TextStyles.bold13,
                      ),
                      const Spacer(),
                     SvgPicture.asset(AppImages.imagesTrash),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${cartItemEntity.calculateTotalWeights()} كم",
                    style: TextStyles.regular13.copyWith(
                      color: colors.secondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      CartItemActionsButton(
                          onTap: () => cartItemEntity.incrementCount(),
                          backgroundColor: colors.primary,
                          iconColor: colors.onPrimary,
                          icon: Icons.add),
                       Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 16),
                        child: Text("${cartItemEntity.count}", style: TextStyles.bold16),
                      ),
                      CartItemActionsButton(
                          onTap: () => cartItemEntity.decrementCount(),
                          backgroundColor: colors.outline,
                          iconColor: colors.onSurfaceVariant,
                          icon: Icons.remove),
                      const Spacer(),
                      Text(
                        "${cartItemEntity.calculateTotalPrice()} جنيه",
                        style: TextStyles.bold16.copyWith(
                          color: colors.secondaryContainer,
                        ),
                      ),
                    ],
                  )
                ]),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
