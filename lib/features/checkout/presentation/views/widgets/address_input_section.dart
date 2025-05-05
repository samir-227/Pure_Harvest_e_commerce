import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              hintText: S.of(context).fullname,
              keyboardType: TextInputType.name),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: S.of(context).email, keyboardType: TextInputType.name),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: S.of(context).address,
              keyboardType: TextInputType.streetAddress),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: S.of(context).city, keyboardType: TextInputType.name),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              hintText: S.of(context).phoneNumber,
              keyboardType: TextInputType.number),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
