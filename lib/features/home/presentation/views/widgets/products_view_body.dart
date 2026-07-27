import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruitify/core/widgets/build_app_bar.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/core/widgets/search_text_field.dart';
import 'package:fruitify/features/home/presentation/views/widgets/Custom_home_app_bar.dart';
import 'package:fruitify/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruitify/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruitify/features/home/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppbar(context, title: 'المنتجات', showBackButton: false),

                const SizedBox(height: 12),

                const SearchTextField(),

                const SizedBox(height: 12),

                ProductsViewHeader(
                  productsLength: context.read<ProductsCubit>().productsLength,
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),

          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
