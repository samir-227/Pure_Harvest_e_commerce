import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/i_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/term_and_condition_widger.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              hintText: S.of(context).fullname,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: S.of(context).password,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TermsAndConditionsWidget(),
            CustomButton(text: S.of(context).createNewAccount),
            const SizedBox(
              height: 26,
            ),
            const IHaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
