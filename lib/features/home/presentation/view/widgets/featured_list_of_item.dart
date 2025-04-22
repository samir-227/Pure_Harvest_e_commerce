import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_item.dart';

class FeaturedListOfItem extends StatelessWidget {
  const FeaturedListOfItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: FeaturedItem(),
          );
        }),
      ),
    );
  }
}
