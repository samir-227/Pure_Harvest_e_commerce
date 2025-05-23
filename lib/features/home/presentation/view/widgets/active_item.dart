import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.title, required this.image});
  final String title, image;
  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<SettingsProvider>(context, listen: false);
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        padding: locale.locale.languageCode == 'ar'
            ? const EdgeInsets.only(left: 8)
            : const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: colors.outline,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  color: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Center(
                child: SvgPicture.asset(
                  image,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyles.semiBold11.copyWith(
                color: colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
