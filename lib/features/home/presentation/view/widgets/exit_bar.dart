import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';
import 'package:fruits_hub/core/networking/firebase_auth_service.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ExitBar extends StatelessWidget {
  const ExitBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 41,
      child: Row(
        children: [
          Text(
            S.of(context).signOut,
            style: TextStyles.bold13.copyWith(color: colors.primary),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                GetIt.I<FirebaseAuthService>().signOut();
                context.go(SingInView.routeName);
              },
              child: SvgPicture.asset(AppImages.imagesExitSvg)),
        ],
      ),
    );
  }
}
