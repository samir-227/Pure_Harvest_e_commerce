import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_divider.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/exit_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/local_change_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/profile_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/profile_item_list.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/theme_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeader(),
          const SizedBox(
            height: 64,
          ),
          Text(
            S.of(context).general,
            style: TextStyles.semiBold16,
          ),
          const SizedBox(
            height: 16,
          ),
          const ProfileItemList(),
          const CustomDivider(),
          const LocalChangeItem(),
          const CustomDivider(),
          const ThemeItem(),
          const CustomDivider(),
          const Spacer(),
          const ExitBar(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
