import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.productsRepo) : super(SearchInitial());
  final ProductsRepo productsRepo;
  int productsLength = 0;
  List<ProductEntity> products = [];
  Future<void> getProducts() async {
    emit(SearchLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(SearchFailure(failure.message)), (products) {
      productsLength = products.length;
      this.products = products;
      emit(SearchSuccess(products));
    });
  }

  void getProductsByName(String name) {
    emit(SearchLoading());
    final result = productsRepo.getProductsByName(name, products);
    productsLength = result.length;
    emit(SearchSuccess(result));
  }
}
