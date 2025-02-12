import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utlis/app_text_style.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFDCDEDE),
          ),
        ),
        const SizedBox(width: 18),
        Text(
          S.of(context).orDividerText,
          style: TextStyles.semiBold16,
        ),
        const SizedBox(width: 18),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
