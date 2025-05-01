import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/product_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl<ProductsRepo>()),
      child: const ProductViewBody(),
    );
  }
}
