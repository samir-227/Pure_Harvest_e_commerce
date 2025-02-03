import 'package:flutter/material.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          pageViewItemModel: PageViewItemModel(
            backgroundImage: AppImages.assetsImagesItem1BackgroundImage,
            image: AppImages.assetsImagesItem1Image,
            title: Row(
              children: [
                Text(
                  'Fruits',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Hub',
                ),
              ],
            ),
            subtitle: 'The best fruits in the world',
          ),
        ),
      ],
    );
  }
}
