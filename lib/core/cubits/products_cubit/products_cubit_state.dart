part of 'products_cubit_cubit.dart';

sealed class ProductsCubitState extends Equatable {
  const ProductsCubitState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsCubitState {}
final class ProductsLoading extends ProductsCubitState {}
final class ProductsFailure extends ProductsCubitState {
  final String errMessage;

  const ProductsFailure({required this.errMessage});
}
final class ProductsSuccess extends ProductsCubitState {
  final List<ProductEntity> products;

 const ProductsSuccess({required this.products});
}
