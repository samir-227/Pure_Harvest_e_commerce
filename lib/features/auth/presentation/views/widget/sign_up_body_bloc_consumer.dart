import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;
import 'package:fruits_hub/core/helpers/build_snack_bar';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart'
    show SignUpFailure, SignUpLoading, SignUpState, SignUpSuccess;
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_up_body.dart';

import '../../cubits/sign_up_cubit/sign_up_cubit.dart';

BlocConsumer<SignUpCubit, SignUpState> signUpBodyBlocConsumer() {
  return BlocConsumer<SignUpCubit, SignUpState>(
    listener: (context, state) {
      if (state is SignUpSuccess) {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Navigator.pop(context);
      }
      if (state is SignUpFailure) {
        showBar(context, state.message);
      }
    },
    builder: (context, state) {
      if (state is SignUpLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return const SignUpBody();
    },
  );
}
