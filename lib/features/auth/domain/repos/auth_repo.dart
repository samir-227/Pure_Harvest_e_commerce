import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/networking/auth_result.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future addUser({required UserEntity user});
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, SocialSignInResult>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithApple();
  Future<UserEntity> getCurrentUser({required String email});
  Future saveUserDataInCash({required UserEntity user});
}
