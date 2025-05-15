import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_item_button.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/locale_provider.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width - 32;
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.imagesBannerDiscountImage),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 33),
                  width: itemWidth * .5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: Svg(AppImages.imagesFeaturedItemBackground),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: Provider.of<LocaleProvider>(context)
                                .locale
                                .languageCode ==
                            'ar'
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        S.of(context).sales,
                        style: TextStyles.regular13.copyWith(
                          color: colors.onPrimary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        S.of(context).discount,
                        style: TextStyles.bold19.copyWith(
                          color: colors.onPrimary,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 32,
                        child: FeaturedItemButton(colors: colors),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
