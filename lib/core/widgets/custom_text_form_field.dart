import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.keyboardType});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(),
        border: buildBorder(context),
        focusedBorder: buildBorder(context),
        enabledBorder: buildBorder(context),
      ),
    );
  }

  OutlineInputBorder buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
