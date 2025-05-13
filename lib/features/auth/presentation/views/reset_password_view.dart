import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/reset_password_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String routeName = '/ResetPasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).forgotPasswordAppBar, showNotification: false),
      body:const ResetPasswordViewBody(),
    );
  }
}
