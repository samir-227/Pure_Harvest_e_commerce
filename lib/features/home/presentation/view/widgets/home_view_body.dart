import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/search_view.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_seller_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view_builder.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_home_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_list_of_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/user_app_bar.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const UserAppBar(),
                const SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      context.push(SearchView.routeName);
                    },
                    child: const CustomHomeSearchBar()),
                const SizedBox(height: 16),
                const FeaturedListOfItem(),
                const SizedBox(height: 16),
                const BestSellerBar(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const ProductsGridViewBuilder(),
        ]),
      ),
    );
  }
}
