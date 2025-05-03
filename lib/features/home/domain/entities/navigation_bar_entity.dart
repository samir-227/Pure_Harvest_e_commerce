
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BottomNavigationBarEntity extends Equatable {
  final String title;
  final String activeImage;
  final String inActiveImage;

  BottomNavigationBarEntity({
    required this.title,
    required this.activeImage,
    required this.inActiveImage,
  });

  static List<BottomNavigationBarEntity> getBottomNavigationBarItems(context) {
    return [
      BottomNavigationBarEntity(
        title: S.of(context).home,
        activeImage: AppImages.imagesBoldHome,
        inActiveImage: AppImages.imagesOutlineHome,
      ),
      BottomNavigationBarEntity(
        title: S.of(context).products,
        activeImage: AppImages.imagesBoldProducts,
        inActiveImage: AppImages.imagesOutlineProducts,
      ),
      BottomNavigationBarEntity(
        title: S.of(context).cart,
        activeImage: AppImages.imagesBoldShoppingCart,
        inActiveImage: AppImages.imagesOutlineShoppingCart,
      ),
      BottomNavigationBarEntity(
        title: S.of(context).profile,
        activeImage: AppImages.imagesBoldUser,
        inActiveImage: AppImages.imagesOutlineUser,
      ),
    ];
  }
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
