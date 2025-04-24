import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/constants/backend_endpoint.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final FirebaseService firebaseService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.firebaseService});
  @override
  // convert userModel to userEntity
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserEntity userEntity =
          UserEntity(email: email, name: name, uId: user.uid);
      await addUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await user.delete();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await user.delete();
      }
      log(" Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure(
          message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getCurrentUser(uId: user.uid);

      var isUserLoggedIn = await firebaseService.isLoggedIn();
      CacheHelper.set(key: 'isUserLoggedIn', value: isUserLoggedIn);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(" Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure(
          message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseService.signInWithGoogle();
      var isUserExist = await databaseService.isDataExist(
          documentId: user.uid, path: BackendEndpoint.addUserData);
      if (isUserExist) {
        await getCurrentUser(uId: user.uid);
      } else {
        await addUser(user: UserModel.fromFireBase(user));
      }
      var isUserLoggedIn = await firebaseService.isLoggedIn();
      CacheHelper.set(key: kIsUserLoggedIn, value: isUserLoggedIn);
      return Right(UserModel.fromFireBase(user));
    } on CustomException catch (e) {
      if (user != null) {
        await user.delete();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await user.delete();
      }
      log(" Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}");
      return left(
        ServerFailure(
          message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseService.signInWithFacebook();
      var isUserExist = await databaseService.isDataExist(
          documentId: user.uid, path: BackendEndpoint.addUserData);
      if (isUserExist) {
        await getCurrentUser(uId: user.uid);
      } else {
        await addUser(user: UserModel.fromFireBase(user));
      }
      return Right(UserModel.fromFireBase(user));
    } on CustomException catch (e) {
      if (user != null) {
        await user.delete();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await user.delete();
      }
      log(" Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}");
      return left(
        ServerFailure(
          message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future addUser({required UserEntity user}) async {
    await databaseService.addUser(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getCurrentUser({required String uId}) async {
    var user = await databaseService.getData(
        path: BackendEndpoint.addUserData, documentId: uId);
    return UserModel.fromMap(user);
  }
}
