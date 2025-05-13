import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helpers/build_snack_bar';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

TextEditingController emailController = TextEditingController();
Future resetPassword =
    FirebaseService().resetPassword(emailController.text.trim());

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            S.of(context).forgetPasswordViewSubtitle,
            style: TextStyles.semiBold16.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
              controller: emailController,
              hintText: S.of(context).enterYourEmail,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 50),
          CustomButton(
              text: S.of(context).resetPassword,
              onPressed: () {
                try {
                  resetPassword;
                  showBar(context, S.of(context).resetPasswordSuccess);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    showBar(context, "هذا الايميل غير موجود");
                  }
                } on Exception catch (e) {
                  log(e.toString());
                  showBar(context, S.of(context).orderFailedMessage);
                } 
              }),
        ],
      ),
    );
  }
}
