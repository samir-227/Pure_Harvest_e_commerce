import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productsLength = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductsFailure(errMessage: failure.message)),
        (products) {
      productsLength = products.length;
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductsFailure(errMessage: failure.message)),
        (products) {
      productsLength = products.length;
      emit(ProductsSuccess(products: products));
    });
  }

  Future <void> getProductsByName(String name) async {
    emit(ProductsLoading());
    try {
      final result = await productsRepo.getProductsByName(name);
      result.fold((failure) => emit(ProductsFailure(errMessage: failure.message)),
          (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      });
    } catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
    
  }

  // Future<void> getProductsByName(String name) async {
  //   emit(ProductsLoading());
  //   final result = await productsRepo.getProductsByName(name);
  //   result.fold((failure) => emit(ProductsFailure(errMessage: failure.message)),
  //       (products) {
  //     productsLength = products.length;
  //     emit(ProductsSuccess(products: products));
  //   });
  // }
}
