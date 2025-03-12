import 'package:flutter/material.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theme/app_text_style.dart';

import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          pageViewItemModel: PageViewItemModel(
              backgroundImage: AppImages.imagesItem1BackgroundImage,
              image: AppImages.imagesItem1Image,
              title: Text.rich(
                TextSpan(
                  text: S.of(context).welcomeTitle,
                  style: TextStyles.bold23.copyWith(),
                  children: [
                    TextSpan(
                      text: ' Fruit',
                      style: TextStyle(
                        color: colors.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'HUB',
                      style: TextStyle(
                        color: colors.secondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: S.of(context).subtitle1),
        ),
        PageViewItem(
          isVisible: false,
          pageViewItemModel: PageViewItemModel(
              backgroundImage: AppImages.imagesPageViewItem2BackgroundImage,
              image: AppImages.imagesItem2Image,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).welcomeTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyles.bold23,
                  ),
                ],
              ),
              subtitle: S.of(context).subtitle2),
        ),
      ],
    );
  }
}
