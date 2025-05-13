import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helpers/build_snack_bar';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/checkout/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OrdersCubitBlocBuilder extends StatelessWidget {
  const OrdersCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
        builder: (context, state) =>
            CustomProgressHud(isLoading: state is OrdersLoading, child: child),
        listener: (context, state) {
          if (state is OrdersSuccess) {
            showBar(context, S.of(context).orderSuccess);
          }
          if (state is OrdersFailure) {
            log(state.errMessage);
            showBar(context, S.of(context).orderFailedMessage);
          }
        });
  }
}
