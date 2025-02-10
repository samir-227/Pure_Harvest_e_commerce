import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

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
        hintStyle: TextStyles.bold13.copyWith(
            color: const Color(
          0xFF949D9E,
        )),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
