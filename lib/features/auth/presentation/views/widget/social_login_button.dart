import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.icon, this.onPressed,
  });
  final String title;
  final String icon;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(width: 1, color: colors.outline),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: onPressed,
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: SvgPicture.asset(
              icon,
              height: 20,
            ),
            title: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyles.semiBold16.copyWith(
                height: 1.40,
                color: colors.onSurface,
              ),
            ),
          )
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       icon,
          //       height: 20,
          //     ),
          //     const SizedBox(
          //       width: 53,
          //     ),
          //     Text(
          //       title,
          //       style: TextStyles.semiBold16
          //           .copyWith(height: 1.40, color: Colors.black),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
