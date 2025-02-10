import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SingInViewBody extends StatelessWidget {
  const SingInViewBody({super.key});

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
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              S.of(context).forgetPassword,
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButton(
              text: S.of(context).login,
              onPressed: () {},
            ),
            const SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).dontHaveAccount,
                  style: TextStyles.semiBold16.copyWith(
                    color: const Color(0xff949D9E),
                    height: 1.40,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(EdgeInsets.only(right: 5)),
                  ),
                  child: Text(
                    S.of(context).register,
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                      height: 1.40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 37,
            ),
          ],
        ),
      ),
    );
  }
}
