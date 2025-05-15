import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/theme_provider.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar(context,
    {required String title,
    bool showBackButton = true,
    bool showNotification = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      )
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Provider.of<ThemeProvider>(context).isDarkMode
            ? const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )
            : const Icon(
                Icons.arrow_back_ios_new,
              ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
