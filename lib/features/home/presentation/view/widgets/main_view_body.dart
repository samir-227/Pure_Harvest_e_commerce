import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/user_app_bar.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserAppBar(),
                SizedBox(height: 16),
                CustomSearchBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
