import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_divider.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/profile_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProfileItemList extends StatelessWidget {
  const ProfileItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getProfileItems(context).length,
      itemBuilder: (context, index) {
        return getProfileItems(context)[index];
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
    );
  }
}

List<Widget> getProfileItems(context) => [
      ProfileItem(
        title: S.of(context).myProfile,
        image: AppImages.imagesUserSvg,
      ),
      ProfileItem(
        title: S.of(context).myOrders,
        image: AppImages.imagesOrdersSvg,
      ),
      ProfileItem(
        title: S.of(context).favorites,
        image: AppImages.imagesFavoriteSvg,
      ),
    ];
