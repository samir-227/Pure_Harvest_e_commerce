import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: S.of(context).searchBarHintText,
          hintStyle: TextStyles.regular16,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 26, right: 8),
            child: SizedBox(
              child: SvgPicture.asset(
                AppImages.imagesSearchIcon,
              ),
              width: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              width: 20,
              child: SvgPicture.asset(
                AppImages.imagesFilter,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
