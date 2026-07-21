import 'package:flutter/widgets.dart';
import 'package:fruitify/core/widgets/best_selling_grid_view.dart';
import 'package:fruitify/core/widgets/search_text_field.dart';
import 'package:fruitify/features/home/presentation/views/widgets/Custom_home_app_bar.dart';
import 'package:fruitify/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitify/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),

                const SizedBox(height: 12),

                const SearchTextField(),

                const SizedBox(height: 12),

                const FeaturedList(),

                const SizedBox(height: 8),

                const BestSellingHeader(),

                const SizedBox(height: 8),
              ],
            ),
          ),

          const BestSellingGridView(),
        ],
      ),
    );
  }
}
