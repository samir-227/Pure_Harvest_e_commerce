import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_seller_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_list_of_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/user_app_bar.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  UserAppBar(),
                  SizedBox(height: 8),
                  CustomSearchBar(),
                  SizedBox(height: 8),
                  FeaturedListOfItem(),
                  SizedBox(height: 16),
                  BestSellerBar(),
                  SizedBox(height: 8),
                ],
              ),
            ),
            BestSellingGridView(),
          ]
          ),
        ),
      ),
    );
  }
}
