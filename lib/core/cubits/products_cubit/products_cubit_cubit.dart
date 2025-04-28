import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

part 'products_cubit_state.dart';

class ProductsCubitCubit extends Cubit<ProductsCubitState> {
  ProductsCubitCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo ;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage:  failure.message)),
      (products) => emit( ProductsSuccess(products: products)),
    );
  }
    Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage:  failure.message)),
      (products) => emit( ProductsSuccess(products: products)),
    );
  }
}
