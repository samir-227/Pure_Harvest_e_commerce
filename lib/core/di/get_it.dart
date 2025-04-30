import 'package:fruits_hub/core/networking/data_base_service.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart'
    show FirebaseService;
import 'package:fruits_hub/core/networking/firestore_service.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo_impl.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDi() {
  sl.registerSingleton<FirebaseService>(FirebaseService());
  sl.registerSingleton<DatabaseService>(FirestoreService());
  sl.registerSingleton<IAuthRepo>(
      AuthRepoImpl(firebaseService: sl(), databaseService: sl()));
    sl.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      databaseService: sl(),
    ),
  );

}
