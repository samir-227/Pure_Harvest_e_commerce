import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/search_view.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_home_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/product_header_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view_builder.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    log("${context.read<ProductsCubit>().productsLength}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: S.of(context).products, showBackButton: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: kVerticalPadding),
                  GestureDetector(
                      onTap: () {
                        context.push(SearchView.routeName);
                      },
                      child: const CustomHomeSearchBar()),
                  const SizedBox(height: 16),
                  ProductHeaderBar(
                    numOfResults: context.read<ProductsCubit>().productsLength,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const ProductsGridViewBuilder(),
          ]),
        ),
      ),
    );
  }
}
