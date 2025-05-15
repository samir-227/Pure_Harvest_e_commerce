import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/constants/backend_endpoint.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/networking/auth_service.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  /// Firebase service for authentication
  final AuthService authService;

  /// Database service for storing and retrieving user data
  final DatabaseService databaseService;

  /// Constructor
  AuthRepoImpl({required this.databaseService, required this.authService});

  /// Create user with email and password
  /// and save user to database
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      // Create user with email and password
      user = await authService.signUpWithEmail(email, password);

      // Convert user model to user entity
      UserEntity userEntity =
          UserEntity(email: email, name: name, uId: user.uid);

      // Add user to database
      await addUser(user: userEntity);

      // Return user entity
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

  /// Sign in user with email and password
  /// and return user entity
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await authService.signInWithEmail(email, password);

      // Check if user is already logged in
      var isUserLoggedIn = authService.isLoggedIn();
      CacheHelper.set(key: 'isUserLoggedIn', value: isUserLoggedIn);

      // Get current user
      var userEntity = await getCurrentUser(uId: user.uid);

      // Save user data
      await saveUserData(user: userEntity);

      // Return user entity
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

  /// Sign in user with Google
  /// and return user entity
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await authService.signInWithGoogle();

      // Check if user is already logged in
      var isUserExist = await databaseService.isDataExist(
          documentId: user.uid, path: BackendEndpoint.addUserData);

      // If user is already logged in
      if (isUserExist) {
        await getCurrentUser(uId: user.uid);
      } else {
        // Add user to database
        await addUser(user: UserModel.fromFireBase(user));
      }
      var isUserLoggedIn = authService.isLoggedIn();
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

  /// Sign in user with Facebook
  /// and return user entity
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await authService.signInWithFacebook();

      // Check if user is already logged in
      var isUserExist = await databaseService.isDataExist(
          documentId: user.uid, path: BackendEndpoint.addUserData);

      // If user is already logged in
      if (isUserExist) {
        await getCurrentUser(uId: user.uid);
      } else {
        // Add user to database
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

  /// Sign in user with Apple
  /// and return user entity
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  /// Add user to database
  @override
  Future addUser({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.email,
    );
  }

  /// Get current user
  @override
  Future<UserEntity> getCurrentUser({required String uId}) async {
    var user = await databaseService.getData(
        path: BackendEndpoint.addUserData, documentId: uId);
    return UserModel.fromJson(user);
  }

  /// Save user data
  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await CacheHelper.set(key: kUserData, value: jsonData);
  }
}
