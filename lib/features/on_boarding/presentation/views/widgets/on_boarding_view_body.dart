import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constans.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: const DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.lightPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: 15),
          child: CustomButton(text: 'ابدأ الان', onPressed: () {}),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
