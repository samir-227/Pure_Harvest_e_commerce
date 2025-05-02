import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_view_body.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});
static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return const CartViewBody();
  }
}
