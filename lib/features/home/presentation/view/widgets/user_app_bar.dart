import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_notification_icon.dart';
import 'package:fruits_hub/generated/l10n.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: Image.asset(AppImages.imagesProfileImage).image,
        ),
        const SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).GoodMorning,
              style: TextStyles.regular16.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'سمير مدحت',
              style: TextStyles.bold16.copyWith(
                color: colors.onSurface,
              ),
            ),
          ],
        ),
        const Spacer(),
        const CustomNotificationIcon(),
      ],
    );
  }
}
