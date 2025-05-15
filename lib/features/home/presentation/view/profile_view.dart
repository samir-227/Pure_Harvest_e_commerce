import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/profile_view_body.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/locale_provider.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context,
            title: S.of(context).profile,
            showBackButton: false,
            showNotification: false),
        body: Consumer<LocaleProvider>(
            builder: (context, localeProvider, child) =>
                const ProfileViewBody()),
      ),
    );
  }
}
