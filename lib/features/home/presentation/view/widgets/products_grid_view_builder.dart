
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helpers/get_dummy_products.dart';
import 'package:fruits_hub/core/widgets/custom_error_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view.dart';

import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBuilder extends StatelessWidget {
  const ProductsGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is ProductsSuccess) {
        // state.products.length.toString());
        return ProductsGridView(
          products: state.products,
          
        );
        
      } else if (state is ProductsFailure) {
        return CustomErrorWidget(message: state.errMessage);
      } else {
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsGridView(
           
            products: getDummyProducts(),
          ),
        );
      }
    });
  }
}
