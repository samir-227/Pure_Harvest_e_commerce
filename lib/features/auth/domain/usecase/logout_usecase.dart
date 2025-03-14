import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class LogoutUseCase {
  final IAuthRepo authRepo;

  LogoutUseCase({required this.authRepo});
  Future<Either<Failure, void>> execute(String email, String password) {
    return authRepo.logOut(email, password);
  }
}
