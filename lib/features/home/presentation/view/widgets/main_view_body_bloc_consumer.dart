import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helpers/build_snack_bar';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/main_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});
  final int currentViewIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartProductAdded) {
            showBar(
                context,
                S
                    .of(context)
                    .ProductAddedToCart); //CustomErrorWidget(message: S.of(context).ProductAddedToCart);
          }
          if (state is CartProductRemoved) {
            showBar(context, S.of(context).ProductRemovedFromCart);
          }
        },
        child: MainViewBody(
          currentViewIndex: currentViewIndex,
        ));
  }
}
