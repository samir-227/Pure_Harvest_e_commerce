import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/search_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).search),
      body: BlocProvider(
        create: (context) => SearchCubit(sl<ProductsRepo>())..getProducts(),
        child: const SearchViewBody(),
      ),
    );
  }
}
