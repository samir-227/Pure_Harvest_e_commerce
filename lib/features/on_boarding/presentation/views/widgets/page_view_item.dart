import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/models/page_view_item_model.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/theming/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key, required this.pageViewItemModel, required this.isVisible});
  final PageViewItemModel pageViewItemModel;
  final bool isVisible;
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
              Positioned(
                top: 0,
                right: 0,
                child: Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                    onTap: () {
                      CacheHelper.set(key: kIsOnBoardingViewSeen, value: true);
                      Navigator.pushReplacementNamed(
                          context, SingInView.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(S.of(context).skip,
                          style: TextStyles.regular13.copyWith(
                            color: const Color(0xFF949D9E),
                          )),
                    ),
                  ),
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
