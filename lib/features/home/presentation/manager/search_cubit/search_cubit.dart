import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.productsRepo) : super(SearchInitial());
  final ProductsRepo productsRepo;
   int productsLength = 0;

      Future <void> getProductsByName(String name) async {
    emit(SearchLoading());
    try {
      final result = await productsRepo.getProductsByName(name);
      result.fold((failure) => emit(SearchFailure( failure.message)),
          (products) {
        productsLength = products.length;
        emit(SearchSuccess(products));
      });
    } catch (e) {
      emit(SearchFailure( e.toString()));
    }
    
  }
  }

