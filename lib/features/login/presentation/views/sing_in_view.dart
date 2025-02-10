import 'package:flutter/material.dart';

import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/login/presentation/views/widgets/sign_in_view_body.dart';

class SingInView extends StatelessWidget {
  const SingInView({
    super.key,
  });
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SingInViewBody(),
    );
  }
}
