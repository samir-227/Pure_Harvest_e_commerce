import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/locale_provider.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class LocalChangeItem extends StatelessWidget {
  const LocalChangeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return Row(
      children: [
        SvgPicture.asset(AppImages.imagesLocalSvg),
        const SizedBox(
          width: 8,
        ),
        Text(
          S.of(context).language,
          style: TextStyles.semiBold13
              .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            localeProvider.setLocale(
              localeProvider.locale.languageCode == 'ar'
                  ? const Locale('en', 'US')
                  : const Locale('ar', 'EG'),
            );
          },
          child: localeProvider.locale.languageCode == 'ar'
              ? const Text('EN')
              : const Text('AR'),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
