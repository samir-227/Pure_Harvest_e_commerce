import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/constants/backend_endpoint.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/features/checkout/data/models/orders_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      var orderModel = OrdersModel.fromEntity(orderEntity);
      await dataBaseService.addData(
          path: BackendEndpoint.orders,
          documentId: orderModel.orderId,
          data: orderModel.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
