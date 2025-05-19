import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/features/auth/presentation/views/reset_password_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruits_hub/features/best_selling_product/presentation/views/best_selling_product_view.dart';
import 'package:fruits_hub/features/checkout/presentation/views/check_out_view.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/main_view.dart';
import 'package:fruits_hub/features/home/presentation/view/products_view.dart';
import 'package:fruits_hub/features/home/presentation/view/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/view/search_view.dart';
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
      final bool isSignedIn =
          CacheHelper.getBool(key: kIsUserLoggedIn) ?? false;
      if (isSkipped) {
        if (isSignedIn) {
          return MainView.routeName;
        } else {
          return SingInView.routeName;
        }
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
      GoRoute(
        path: BestSellingProductView.routeName,
        name: BestSellingProductView.routeName,
        builder: (context, state) => const BestSellingProductView(),
      ),
      GoRoute(
        path: ProductsView.routeName,
        name: ProductsView.routeName,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: CheckOutView.routeName,
        name: CheckOutView.routeName,
        builder: (context, state) =>
            CheckOutView(cartEntity: state.extra as CartEntity),
      ),
      GoRoute(
        path: ResetPasswordView.routeName,
        name: ResetPasswordView.routeName,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: ProfileView.routeName,
        name: ProfileView.routeName,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: SearchView.routeName,
        name: SearchView.routeName,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
