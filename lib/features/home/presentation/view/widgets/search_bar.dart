import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onChanged});

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            blurRadius: 5,
            offset: const Offset(0, .2),
            spreadRadius: .3,
          )
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.outline,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: S.of(context).searchBarHintText,
          hintStyle: TextStyles.regular16,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: SizedBox(
              child: SvgPicture.asset(
                AppImages.imagesSearchIcon,
              ),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: SvgPicture.asset(
              AppImages.imagesFilter,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
