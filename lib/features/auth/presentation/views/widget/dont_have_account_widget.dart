import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: TextStyles.semiBold16.copyWith(
            color: colors.onSurfaceVariant,
            height: 1.40,
          ),
        ),
        TextButton(
          onPressed: () {
            context.push(SignUpView.routeName);
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.only(right: 5)),
          ),
          child: Text(
            S.of(context).register,
            style: TextStyles.semiBold16.copyWith(
              color: colors.primary,
              height: 1.40,
            ),
          ),
        ),
      ],
    );
  }
}
