import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_seller_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_grid_view_builder.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_button_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_list_of_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/user_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
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
          BestSellingGridViewBuilder(),
        ]),
      ),
    );
  }
}
