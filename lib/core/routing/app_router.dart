import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruits_hub/features/home/presentation/view/main_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

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
      GoRoute(
        path: MainView.routeName,
        name: MainView.routeName,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
