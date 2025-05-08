import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/best_selling_product/presentation/views/widget/best_selling_product_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BestSellingProductView extends StatelessWidget {
  const BestSellingProductView({super.key});
  static const String routeName = '/best/selling/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, title: S.of(context).bestSeller),
        body: const BestSellingProductViewBody());
  }
}
