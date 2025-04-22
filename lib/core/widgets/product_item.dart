import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.outline,
        borderRadius: BorderRadius.circular(4),
      ),
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
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  AppImages.imagesWatermelonTestImage,
                ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                    title: Text(
                      'بطيخ',
                      style: TextStyles.semiBold16.copyWith(
                        color: colors.onSecondary,
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '20',
                            style: TextStyles.bold13
                                .copyWith(color: colors.secondaryContainer),
                          ),
                          TextSpan(
                            text: ' جنيه',
                            style: TextStyles.bold13.copyWith(
                                color: colors.secondaryContainer, height: 2.4),
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
                        onPressed: () {},
                        icon: Icon(Icons.add, color: colors.onPrimary),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
