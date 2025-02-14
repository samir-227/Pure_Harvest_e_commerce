import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/custom_check_box.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key});

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

bool isTermsAccepted = false;

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(0, -8),
          child: CustomCheckBox(
            onChanged: (value) {
              setState(() {
                isTermsAccepted = value;
              });
            },
            isChecked: isTermsAccepted,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'من خلال إنشاء حساب، فإنك توافق على ',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF949D9E),
              ),
              children: const [
                TextSpan(
                  text: 'الشروط وأحكامنا الخاصة بنا',
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
