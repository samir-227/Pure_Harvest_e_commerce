import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/helpers/get_user_data_func.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/orders_cubit_bloc_builder.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const routeName = '/CheckOutView';
  final CartEntity cartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
        uid: getUserDataFromCache().uId,
        cartEntity: widget.cartEntity,
        shippingAddress: ShippingAddressEntity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(ordersRepo: sl()),
      child: Scaffold(
          body: Provider.value(
              value: orderEntity, child:const OrdersCubitBlocBuilder(child:  CheckOutViewBody()))),
    );
  }
}
