import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_list.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_cart_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_divider.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kVerticalPadding,
                    ),
                    buildAppBar(context,
                        title: S.of(context).theCart,
                        showNotification: false,
                        showBackButton: false),
                    const SizedBox(
                      height: 16,
                    ),
                    const CartHeader(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : const CustomDivider(),
              ),
              CartItemList(
                  cartItems: context.watch<CartCubit>().cartEntity.cartItems),
              SliverToBoxAdapter(
                child: context.watch<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : const CustomDivider(),
              ),
            ],
          ),
          context.watch<CartCubit>().cartEntity.cartItems.isEmpty
              ? const SizedBox()
              : Positioned(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).size.height * .09,
                  child: const CustomCartButton(),
                )
        ],
      ),
    );
  }
}
