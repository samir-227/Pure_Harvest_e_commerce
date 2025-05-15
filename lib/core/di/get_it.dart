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
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDi() {
  sl.registerSingleton<AuthService>(FirebaseAuthService());
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  sl.registerSingleton<DatabaseService>(FirestoreService());
  sl.registerSingleton<IAuthRepo>(
      AuthRepoImpl(authService: sl(), databaseService: sl()));
  sl.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      databaseService: sl(),
    ),
  );
  sl.registerSingleton<OrdersRepo>(OrdersRepoImpl(dataBaseService: sl()));
}
