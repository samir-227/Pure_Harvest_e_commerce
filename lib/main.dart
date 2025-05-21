import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/utlis/api/api_keys.dart';
import 'package:fruits_hub/pure_harvest.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  initDi();
  Bloc.observer = CustomBlocObserver();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await CacheHelper.init();

  // Register Hive adapters
  Hive.registerAdapter(ReviewEntityAdapter());
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CartItemEntityAdapter());

  // Open Hive box for cart items

  runApp(
    BlocProvider(
      create: (context) => sl<CartCubit>(),
      child: const PureHarvest(),
    ),
  );
}
