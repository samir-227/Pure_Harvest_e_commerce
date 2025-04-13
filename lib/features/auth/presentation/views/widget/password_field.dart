import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      hintText: S.of(context).password,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              )
            : const Icon(Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF)),
      ),
      onSaved: widget.onSaved,
    );
  }
}
