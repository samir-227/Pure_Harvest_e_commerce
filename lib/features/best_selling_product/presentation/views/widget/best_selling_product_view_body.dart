import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';


class BestSellingProductViewBody extends StatelessWidget {
  const BestSellingProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(context, title: S.of(context).bestSeller, actions: const [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: NotificationWidget(),
        )
      ]),
      
    );
  }
}
