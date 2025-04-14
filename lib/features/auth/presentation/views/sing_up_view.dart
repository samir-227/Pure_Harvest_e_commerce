import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_up_body_bloc_consumer.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/singUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(sl<IAuthRepo>()),
      child: Scaffold( 
        appBar: buildAppBar(context, title: S.of(context).appBarRegisterTitle),
        body: signUpBodyBlocConsumer(),
      ),
    );
  }
}
