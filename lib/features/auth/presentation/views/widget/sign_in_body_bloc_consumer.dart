import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helpers/build_snack_bar';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_in_view_body.dart';
import 'package:fruits_hub/features/home/presentation/view/main_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

BlocConsumer<SignInCubit, SignInState> signInBodyConsumer() {
  return BlocConsumer<SignInCubit, SignInState>(
    listener: (context, state) {
      if (state is AuthState) {
        if (state.isNewUser) {
          // Navigate to SignUpView to complete user profile
          GetIt.I<FirebaseAuthService>().deleteUser();
          context.pushNamed(SignUpView.routeName);
        } else {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null && user.emailVerified) {
            // Navigate to Home/MainView if email is verified
            context.goNamed(MainView.routeName);
          } else {
            // Show error if email not verified
            showBar(context, S.of(context).EmailNotVerified);
          }
        }
      } else if (state is SignInSuccess) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null && user.emailVerified) {
          context.goNamed(MainView.routeName);
        } else {
          showBar(context, S.of(context).EmailNotVerified);
        }
      } else if (state is SignInFailure) {
        showBar(context, state.message);
      }
      if (state is SignInFailure) {
        showBar(context, state.message);
      }
    },
    // listener: (context, state) {
    //   if (state is SignInSuccess) {
    //     if (FirebaseAuth.instance.currentUser!.emailVerified) {
    //       context.goNamed(MainView.routeName);
    //     } else {
    //      showBar(context, S.of(context).EmailNotVerified);
    //     }
    //   }
    //   if (state is SignInFailure) {
    //     showBar(context, state.message);
    //   }
    // },
    builder: (context, state) {
      if (state is SignInLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return const SingInViewBody();
    },
  );
}
