import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/search_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/search_result_grid_view_builder.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CustomSearchBar(
                  onChanged: (value) {
                    context.read<SearchCubit>().getProductsByName(value);
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).searchResult,
                  style: TextStyles.regular13.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SearchResultGridViewBuilder(),
        ]),
      ),
    );
  }
}
