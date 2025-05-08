import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/repos/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());
  void addOrder(OrderEntity order) async {
    emit(OrdersLoading());
    final result = await ordersRepo.addOrder(order);
    result.fold((failure) => emit(OrdersFailure(errMessage: failure.message)),
        (success) => emit(OrdersSuccess()));
  }
}
