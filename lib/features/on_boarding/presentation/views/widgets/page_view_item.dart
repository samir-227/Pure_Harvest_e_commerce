import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';

import '../../../../../core/utlis/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewItemModel});
  final PageViewItemModel pageViewItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppImages.imagesItem1BackgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  pageViewItemModel.image,
                  width: 270,
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('تخطي'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        pageViewItemModel.title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            textAlign: TextAlign.center,
            pageViewItemModel.subtitle,
            style: TextStyles.semiBold13,
          ),
        ),
      ],
    );
  }
}
