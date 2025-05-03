import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getCheckOutSteps(context).length,
        (index) => Expanded(
          child: StepItem(
            index: index + 1,
            isActive: false,
            title: getCheckOutSteps(context)[index],
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
      S.of(context).review,
    ];
