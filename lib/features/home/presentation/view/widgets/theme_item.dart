import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/theme_provider.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Row(
      children: [
        SvgPicture.asset(AppImages.imagesThemeSvg),
        const SizedBox(
          width: 8,
        ),
        Text(
          S.of(context).mode,
          style: TextStyles.semiBold13
              .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          child: themeProvider.isDarkMode
              ? Text(S.of(context).lightMode)
              : Text(S.of(context).darkMode),
        ),
      ],
    );
  }
}
