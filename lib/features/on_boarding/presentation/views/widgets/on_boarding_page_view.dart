import 'package:flutter/material.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            backgroundImage: AppImages.imagesItem1BackgroundImage,
            image: AppImages.imagesItem1Image,
            title: Text.rich(
              TextSpan(
                text: ' Fruit',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
                children: const [
                  TextSpan(
                    text: 'HUB',
                    style: TextStyle(
                      color: Color(0xFFF4A91F),
                    ),
                  ),
                  TextSpan(
                    text: ' مرحبًا بك في',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          ),
        ),
        const PageViewItem(
          pageViewItemModel: PageViewItemModel(
            backgroundImage: AppImages.imagesItem2BackgroundImage,
            image: AppImages.imagesItem2Image,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ابحث وتسوق',
                  textAlign: TextAlign.center,
                  style: TextStyles.bold23,
                ),
              ],
            ),
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          ),
        ),
      ],
    );
  }
}
