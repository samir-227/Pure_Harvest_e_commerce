import 'package:fruits_hub/core/networking/auth_service.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';

import 'package:fruits_hub/core/networking/firestore_service.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo_impl.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/checkout/data/repos/orders_repo_impl.dart';
import 'package:fruits_hub/features/checkout/domain/repos/orders_repo.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDi() {
  /// Core
  sl.registerSingleton<AuthService>(FirebaseAuthService());
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  sl.registerSingleton<DatabaseService>(FirestoreService());

  /// Features - Auth
  sl.registerSingleton<IAuthRepo>(
    AuthRepoImpl(
      authService: sl(),
      databaseService: sl(),
    ),
  );

  /// Features - Home
  sl.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      databaseService: sl(),
    ),
  );

  /// Features - Checkout
  sl.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(
      dataBaseService: sl(),
    ),
  );

  /// Presentation
  sl.registerSingleton<CartCubit>(CartCubit());
}

