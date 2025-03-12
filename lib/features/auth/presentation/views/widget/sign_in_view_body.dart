import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theme/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/social_login_button.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../on_boarding/presentation/provider/theme_provider.dart';

class SingInViewBody extends StatelessWidget {
  const SingInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              child: Text(
                  themeProvider.isDarkMode ? 'الوضع الفاتح' : 'الوضع الداكن'),
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
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: colors.onSurfaceVariant,
              ),
            ),
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
              height: 33,
            ),
            CustomButton(
              text: S.of(context).login,
              onPressed: () {},
            ),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
            const SizedBox(
              height: 33,
            ),
            SocialLoginButton(
              title: S.of(context).loginWithGoogle,
              icon: AppImages.imagesGoogle,
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                title: S.of(context).loginWithApple,
                icon: AppImages.imagesApple),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              title: S.of(context).loginWithFacebook,
              icon: AppImages.imagesFacebook,
            ),
          ],
        ),
      ),
    );
  }
}
