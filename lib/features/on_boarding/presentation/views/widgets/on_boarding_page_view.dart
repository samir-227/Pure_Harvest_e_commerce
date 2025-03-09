import 'package:flutter/material.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
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
                  children: const [
                    TextSpan(
                      text: ' Fruit',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'HUB',
                      style: TextStyle(
                        color: Color(0xFFF4A91F),
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
                    style: TextStyles.bold23.copyWith(fontFamily: 'cairo'),
                  ),
                ],
              ),
              subtitle: S.of(context).subtitle2),
        ),
      ],
    );
  }
}
