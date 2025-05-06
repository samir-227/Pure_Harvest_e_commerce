import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(context,
              title: S.of(context).shipping, showNotification: false),
          const SizedBox(height: 16),
          CheckOutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutPageView(
              controller: pageController,
            ),
          ),
          CustomButton(
              text: getButtonText(context, currentPageIndex),
              onPressed: () {
                pageController.animateToPage(currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

String getButtonText(BuildContext context, int currentPageIndex) {
  switch (currentPageIndex) {
    case 0:
      return S.of(context).next;
    case 1:
      return S.of(context).next;
    case 2:
      return S.of(context).PayPal;

    default:
      return S.of(context).next;
  }
}
