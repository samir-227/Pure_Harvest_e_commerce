import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 11.5,
            backgroundColor: colors.outline,
            child: Text(
              index.toString(),
              style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
            )),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyles.bold13.copyWith(color: colors.onSurfaceVariant),
        ),
      ],
    );
  }
}
