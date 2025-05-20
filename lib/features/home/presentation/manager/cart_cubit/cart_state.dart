part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final CartEntity cartEntity;

  const CartLoaded({required this.cartEntity});
}

final class CartProductRemoved extends CartState {}
