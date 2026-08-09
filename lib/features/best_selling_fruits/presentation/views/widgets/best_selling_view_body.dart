import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruitify/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitify/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:gap/gap.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(16),
                BestSellingHeader(visibleMore: false),
                Gap(16),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
