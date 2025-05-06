import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getCheckOutSteps(context).length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: StepItem(
              index: index + 1,
              isActive: index <= currentPageIndex,
              title: getCheckOutSteps(context)[index],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getCheckOutSteps(BuildContext context) => [
      S.of(context).shipping,
      S.of(context).address,
      S.of(context).payment,
    ];
