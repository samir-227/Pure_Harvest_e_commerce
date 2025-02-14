import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utlis/app_colors.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  @override
  _TermsAndConditionsWidgetState createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Colors.green,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        // Text(
        //   'من خلال إنشاء حساب، فإنك توافق على ',
        //   style: TextStyles.semiBold13.copyWith(
        //     color: const Color(0xFF949D9E),
        //   ),
        // ),
        // Text(
        //   'الشروط وأحكامنا الخاصة بنا\n',
        //   style: TextStyles.semiBold13.copyWith(
        //     color: AppColors.lightPrimaryColor,
        //   ),
        // ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'من خلال إنشاء حساب، فإنك توافق على ',
              style: TextStyles.semiBold13.copyWith(
                color: Color(0xFF949D9E),
              ),
              children: [
                TextSpan(
                  text: 'الشروط ',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(
                  text: 'وأحكامنا الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
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
