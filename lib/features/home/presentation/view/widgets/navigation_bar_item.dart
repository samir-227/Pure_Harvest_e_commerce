import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isActive,
      required this.bottomNavigationBarEntity});
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            title: bottomNavigationBarEntity.title,
            image: bottomNavigationBarEntity.activeImage,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
