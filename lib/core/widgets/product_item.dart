import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final imageSize = width * 0.55;

        return Container(
          decoration: BoxDecoration(
            color: colors.outline,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: colors.onSecondary,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: width * 0.05),
                  Center(
                    child: product.imageUrl != null
                        ? Container(
                            height: imageSize,
                            width: imageSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CustomNetworkImage(
                              imageUrl: product.imageUrl!,
                              fit: BoxFit.contain,
                            ),
                          )
                        : SizedBox(
                            height: imageSize,
                            width: imageSize,
                          ),
                  ),
                  SizedBox(height: width * 0.08),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          product.name,
                          style: TextStyles.semiBold16.copyWith(
                            color: colors.onSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${product.price}',
                                style: TextStyles.bold13
                                    .copyWith(color: colors.secondaryContainer),
                              ),
                              TextSpan(
                                text: ' جنيه',
                                style: TextStyles.bold13.copyWith(
                                    color: colors.secondaryContainer,
                                    height: 2.4),
                              ),
                              TextSpan(
                                text: ' / ',
                                style: TextStyles.semiBold13
                                    .copyWith(color: colors.secondaryContainer),
                              ),
                              TextSpan(
                                text: 'كيلو',
                                style: TextStyles.semiBold13
                                    .copyWith(color: colors.secondaryContainer),
                              )
                            ],
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: colors.primary,
                          child: IconButton(
                            onPressed: () {
                              context.read<CartCubit>().addProduct(product);
                            },
                            icon: Icon(Icons.add, color: colors.onPrimary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
