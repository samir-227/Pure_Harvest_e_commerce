import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helpers/get_dummy_products.dart';
import 'package:fruits_hub/core/widgets/custom_error_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/failed_search_widget.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultGridViewBuilder extends StatelessWidget {
  const SearchResultGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        // state.products.length.toString());
        return ProductsGridView(
          products: state.products,
        );
      } else if (state is SearchFailure) {
        return SliverToBoxAdapter(
            child: CustomErrorWidget(message: state.message));
      } else if (state is SearchLoading) {
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsGridView(
            products: getDummyProducts(),
          ),
        );
      } else {
        return const SliverToBoxAdapter(child: FailedSearchWidget());
      }
    });
  }
}
