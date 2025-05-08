import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).deliveryTitle,
              style: TextStyles.bold16,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: SizedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.imagesEdit,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      S.of(context).edit,
                      style: TextStyles.semiBold13.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.imagesLocation,
              width: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              ' ${context.read<OrderEntity>().shippingAddress.getAddress()} ',
              textAlign: TextAlign.right,
              style: TextStyles.regular13.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
