import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.title, required this.index, required this.isActive});
 final String title;
 final int index;
 final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(firstChild: InactiveStepItem(title: title, index: index), secondChild: ActiveStepItem(title: title), crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst, duration: const Duration(milliseconds: 300),);
  }
}