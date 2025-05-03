part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartProductAdded extends CartState {}

final class CartProductRemoved extends CartState {}
