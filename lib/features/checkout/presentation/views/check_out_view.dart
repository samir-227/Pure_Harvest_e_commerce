import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const routeName = '/CheckOutView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CheckOutViewBody());
  }
}
