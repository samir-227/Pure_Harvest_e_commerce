import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_list.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_view_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: kVerticalPadding,
              ),
              buildAppBar(context,
                  title: S.of(context).theCart, showNotification: false),
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
        const CartItemList(cartItems: []),
      ]),
      Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height * .09,
        child: CustomButton(text: "الدفع  120جنيه", onPressed: () {}),
      )
    ]));
  }
}
