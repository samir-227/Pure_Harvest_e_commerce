import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final FirebaseService firebaseService;

  AuthRepoImpl({required this.firebaseService});
  @override
  // convert userModel to userEntity
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFireBase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(
          message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple(
      String email, String password) {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook(
      String email, String password) {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle(
      String email, String password) {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
