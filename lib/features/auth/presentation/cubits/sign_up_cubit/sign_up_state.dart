import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpCubitLoading extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}

class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccess(this.userEntity);
}