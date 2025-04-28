import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/constants/backend_endpoint.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var result = await databaseService.getData(
          path: BackendEndpoint.getProduct,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          result.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var result = await databaseService.getData(
          path: BackendEndpoint.getProduct) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          result.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get products'));
    }
  }
}
