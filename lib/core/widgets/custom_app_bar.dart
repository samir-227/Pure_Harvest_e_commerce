import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold23,
    ),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
