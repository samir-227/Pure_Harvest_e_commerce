import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class LoginUseCase {
  final IAuthRepo authRepo;

  LoginUseCase({required this.authRepo});
  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return authRepo.logIn(email, password);
  }
}
