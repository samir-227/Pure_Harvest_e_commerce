import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/check_out_view.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            text:
                "الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
            onPressed: () {
              context.pushNamed(CheckOutView.routeName,
                  extra: context.read<CartCubit>().cartEntity);
            });
      },
    );
  }
}
