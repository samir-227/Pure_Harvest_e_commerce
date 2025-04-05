import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_in_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SingInView extends StatelessWidget {
  const SingInView({
    super.key,
  });
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).appBarLoginTitle),
      body: const SingInViewBody(),
    );
  }
}
