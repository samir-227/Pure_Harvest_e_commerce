import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utlis/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(AppImages.assetsImagesSplashImage),
        SvgPicture.asset(
          AppImages.assetsImagesSplashCircles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
