import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_error_bar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_in_view_body.dart';
import 'package:fruits_hub/features/home/presentation/view/main_view.dart';
import 'package:go_router/go_router.dart';

BlocConsumer<SignInCubit, SignInState> signInBodyConsumer() {
  return BlocConsumer<SignInCubit, SignInState>(
    listener: (context, state) {
      if (state is SignInSuccess) {
        log('success 111111');
        context.goNamed(MainView.routeName);
      } 
      if (state is SignInFailure) {
        buildErrorBar(context, state.message);
      }
    },
    builder: (context, state) {
      if (state is SignInLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return const SingInViewBody();
    },
  );
}
