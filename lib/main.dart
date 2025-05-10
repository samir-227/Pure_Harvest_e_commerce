import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/utlis/api/api_keys.dart';
import 'package:fruits_hub/fruits_hub.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseService.firebaseUserState();
  initDi();
  Bloc.observer = CustomBlocObserver();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  FlutterNativeSplash.remove();
  Stripe.publishableKey=ApiKeys.publishableKey;
  runApp(
    const FruitsHub(),
  );
}
