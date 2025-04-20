import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIconConstraints: const BoxConstraints(
              maxWidth: double.infinity, maxHeight: double.infinity),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: S.of(context).searchBarHintText,
          hintStyle: TextStyles.regular16,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: SvgPicture.asset(
              AppImages.imagesSearchIcon,
              width: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 16),
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
