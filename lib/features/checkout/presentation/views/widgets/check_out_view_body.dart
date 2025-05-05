import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
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
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(context,
              title: S.of(context).shipping, showNotification: false),
          const SizedBox(height: 16),
          const CheckOutSteps(),
          Expanded(
              child: CheckoutPageView(
            controller: pageController,
          )),
        ],
      ),
    );
  }
}
