part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}


final class AuthState extends SignInState {
  final UserEntity user;
  final bool isNewUser;
  const AuthState(this.user, this.isNewUser);
}
final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity user;
  const SignInSuccess(this.user);
}

final class SignInFailure extends SignInState {
  final String message;
  const SignInFailure(this.message);
}
