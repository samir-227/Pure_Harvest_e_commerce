import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold23,
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: () => context.pop(),
    ),
  );
}
