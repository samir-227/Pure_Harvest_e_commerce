import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/helpers/get_user_data_func.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

import 'package:fruits_hub/generated/l10n.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      trailing: const NotificationWidget(),
      leading: Image.asset(AppImages.imagesProfileImage),
      title: Text(
        S.of(context).GoodMorning,
        style: TextStyles.regular16.copyWith(
          color: colors.onSurfaceVariant,
        ),
      ),
      subtitle: Text(
        getUserDataFromCache().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16.copyWith(
          color: colors.onSurface,
        ),
      ),
    );
  }
}
