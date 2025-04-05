import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/cache/cache_helper.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

// Route<dynamic> onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     // case SplashView.routeName:
//     //   return MaterialPageRoute(builder: (_) => const SplashView());
//     case OnBoardingView.routeName:
//       return MaterialPageRoute(builder: (_) => const OnBoardingView());
//     case SingInView.routeName:
//       return MaterialPageRoute(builder: (_) => const SingInView());
//     case SignUpView.routeName:
//       return MaterialPageRoute(builder: (_) => const SignUpView());
//     default:
//       return MaterialPageRoute(builder: (_) => const Placeholder());
//   }
// }

// }
// static String _getInitialLocation() {
// if (settings. isFirstTime) {
// return OnboardingScreen.path;
// if (Isettings.isLoggedIn) {
// return LoginScreen.path;
// return ClinicApp.path;
// }
// }
// }

sealed class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    redirect: (context, state) async {
      if (state.fullPath?.isNotEmpty ?? false) return state.fullPath;
      final bool isSkipped =
          CacheHelper.getBool(key: kIsOnBoardingViewSeen) ?? false;
      if (isSkipped) {
        return SingInView.routeName;
      } else {
        return OnBoardingView.routeName;
      }
    },
    routes: [
      GoRoute(
        path: OnBoardingView.routeName,
        name: OnBoardingView.routeName,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: SingInView.routeName,
        name: SingInView.routeName,
        builder: (context, state) => const SingInView(),
      ),
      GoRoute(
        path: SignUpView.routeName,
        name: SignUpView.routeName,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
