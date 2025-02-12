import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFDCDEDE)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: () {},
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
                color: Colors.black,
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
