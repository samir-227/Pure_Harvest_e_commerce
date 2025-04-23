import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    actions: actions,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: () => context.pop(),
    ),
  );
}
