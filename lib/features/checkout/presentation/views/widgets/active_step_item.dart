import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: colors.primary,
          child: Icon(
            size: 16,
            Icons.check,
            color: colors.onPrimary,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyles.bold13.copyWith(color: colors.primary),
        ),
      ],
    );
  }
}
