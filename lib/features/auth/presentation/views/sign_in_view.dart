import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/di/get_it.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/sign_in_body_bloc_consumer.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SingInView extends StatelessWidget {
  const SingInView({
    super.key,
  });
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(sl<IAuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: S.of(context).appBarLoginTitle),
        body: signInBodyConsumer(),
      ),
    );
  }
}
