import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/widget/custom_check_box.dart';
import 'package:fruits_hub/generated/l10n.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

bool isTermsAccepted = false;


class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(0, -8),
          child: CustomCheckBox(
            onChanged: (value) {
              setState(() {
                isTermsAccepted = value;
                widget.onChanged(value);
              });
            },
            isChecked: isTermsAccepted,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).TermsAndConditions,
                  style: TextStyles.semiBold13.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: ' ${S.of(context).Policy} ',
                  style: TextStyles.semiBold13.copyWith(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
