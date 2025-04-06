import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      required this.keyboardType,
      this.onSaved});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Field is required' : null,
      obscureText: obscureText,
      onSaved: onSaved,
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
