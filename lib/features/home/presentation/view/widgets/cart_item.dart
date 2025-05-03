import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_actions_button.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                color: colors.outline,
                width: 73,
                height: 90,
                child: CustomNetworkImage(
                    imageUrl: cartItemEntity.product.imageUrl!),
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
                          GestureDetector(
                              onTap: () => context
                                  .read<CartCubit>()
                                  .removeProduct(cartItemEntity),
                              child: SvgPicture.asset(AppImages.imagesTrash)),
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
                          CartItemActionButtons(cartItemEntity: cartItemEntity),
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
      },
    );
  }
}
