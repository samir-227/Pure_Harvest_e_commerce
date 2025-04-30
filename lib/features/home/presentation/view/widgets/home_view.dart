import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ProductsCubit(sl<ProductsRepo>()),
        child: const HomeViewBody(),
      ),
    );
  }
}
