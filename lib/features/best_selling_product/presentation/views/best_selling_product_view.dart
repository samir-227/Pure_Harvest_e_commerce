import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling_product/presentation/views/widget/best_selling_product_view_body.dart';

class BestSellingProductView extends StatelessWidget {
  const BestSellingProductView({super.key});
  static const String routeName = '/best/selling/product';

  @override
  Widget build(BuildContext context) {
    return const BestSellingProductViewBody();
  }
}
