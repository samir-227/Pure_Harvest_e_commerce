import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/i_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/term_and_condition_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: S.of(context).fullname,
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(onSaved: (value) {
                password = value!;
              }),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionWidget(
                onChanged: (value) => termsAccepted = value,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: S.of(context).createNewAccount,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (!termsAccepted) {
                      buildErrorBar(context,
                          S.of(context).PleaseAcceptTermsAndConditions);
                      return;
                    }

                    context.read<SignUpCubit>().createUserWithEmailAndPassword(
                          name: name,
                          email: email,
                          password: password,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }

                  //   if (formKey.currentState!.validate()) {
                  //     formKey.currentState!.save();

                  //     if (!termsAccepted) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text(
                  //               S.of(context).PleaseAcceptTermsAndConditions),
                  //         ),
                  //       );
                  //       return;
                  //     }

                  //     try {
                  //       // Create user account
                  //       await context
                  //           .read<SignUpCubit>()
                  //           .createUserWithEmailAndPassword(
                  //             name: name,
                  //             email: email,
                  //             password: password,
                  //           );

                  //       // Send email verification
                  //       await FirebaseService.sendEmailVerification();

                  //       // Navigate to verification screen or show success message
                  //     } catch (e) {
                  //       // Handle generic errors
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text('خطا في الانشاء ')),
                  //       );
                  //     }
                  //   } else {
                  //     setState(() {
                  //       autovalidateMode = AutovalidateMode.always;
                  //     });
                  //   }
                },
              ),
              const SizedBox(
                height: 26,
              ),
              const IHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
