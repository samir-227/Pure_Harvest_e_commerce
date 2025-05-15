import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/helpers/get_user_data_func.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(clipBehavior: Clip.none, children: [
          CircleAvatar(
            radius: 35,
            child: Image.asset(AppImages.imagesProfileImage),
          ),
          Positioned(
            top: 50,
            right: 9.5,
            child: Container(
              width: 50,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(width: 2, color: Colors.white))),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outline,
                radius: 15,
                child: Image.asset(
                  AppImages.imagesCamera,
                  width: 20,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(
          width: 24,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            getUserDataFromCache().name ,
            style: TextStyles.bold13,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            getUserDataFromCache().email,
            style: TextStyles.regular13.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ])
      ],
    );
  }
}
