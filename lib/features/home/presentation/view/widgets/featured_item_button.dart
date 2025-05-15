import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () {},
      child: Text(
        S.of(context).shopNow,
        style: TextStyles.bold13.copyWith(
          color: colors.primary,
        ),
      ),
    );
  }
}
