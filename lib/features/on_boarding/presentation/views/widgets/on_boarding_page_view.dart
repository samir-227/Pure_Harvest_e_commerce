import 'package:flutter/material.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';
import 'package:fruits_hub/core/utlis/app_texte_style.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            backgroundImage: AppImages.assetsImagesItem1BackgroundImage,
            image: AppImages.assetsImagesItem1Image,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fruits',
                ),
                Text(
                  'Hub',
                ),
              ],
            ),
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          ),
        ),
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            backgroundImage: AppImages.assetsImagesItem2BackgroundImage,
            image: AppImages.assetsImagesItem2Image,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ابحث وتسوق',
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold13,
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
