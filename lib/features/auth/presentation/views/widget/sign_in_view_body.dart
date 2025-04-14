import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/social_login_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SingInViewBody extends StatefulWidget {
  const SingInViewBody({super.key});

  @override
  State<SingInViewBody> createState() => _SingInViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SingInViewBodyState extends State<SingInViewBody> {
  late String? email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordField(onSaved: (value) {
                password = value;
              }),
              const SizedBox(
                height: 16,
              ),
              Text(
                S.of(context).forgetPassword,
                style: TextStyles.semiBold13.copyWith(
                  color: colors.secondary,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                text: S.of(context).login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    log('email: $email, password: $password');
                    context
                        .read<SignInCubit>()
                        .signInWithEmailAndPassword(email!, password!);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const DontHaveAccountWidget(),
              const SizedBox(
                height: 32,
              ),
              const OrDivider(),
              const SizedBox(
                height: 20,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                title: S.of(context).loginWithGoogle,
                icon: AppImages.imagesGoogle,
              ),
              const SizedBox(
                height: 20,
              ),
              SocialLoginButton(
                  title: S.of(context).loginWithApple,
                  icon: AppImages.imagesApple),
              const SizedBox(
                height: 20,
              ),
              SocialLoginButton(
                title: S.of(context).loginWithFacebook,
                icon: AppImages.imagesFacebook,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
