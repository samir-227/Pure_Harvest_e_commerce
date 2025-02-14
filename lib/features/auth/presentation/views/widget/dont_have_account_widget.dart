import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up.dart';
import 'package:fruits_hub/generated/l10n.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignUpView.routeName);
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.only(right: 5)),
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
    );
  }
}
