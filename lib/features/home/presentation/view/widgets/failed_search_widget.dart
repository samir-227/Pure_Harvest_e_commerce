import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class FailedSearchWidget extends StatelessWidget {
  const FailedSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        height: 200,
      ),
      SvgPicture.asset(AppImages.imagesSearchResult),
      const SizedBox(
        height: 20,
      ),
      Text(
        S.of(context).failedSearch,
        style: TextStyles.regular13
            .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    ]);
  }
}
