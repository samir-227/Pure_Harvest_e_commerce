import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.image,
  });
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyles.semiBold13.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
