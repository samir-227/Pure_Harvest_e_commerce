import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SignupUseCase {
  final IAuthRepo authRepo;

  SignupUseCase({required this.authRepo});
  Future<Either<Failure, UserEntity>> execute(String name, String email, String password) {
    return authRepo.signUp(email, password, name);
  }
}
