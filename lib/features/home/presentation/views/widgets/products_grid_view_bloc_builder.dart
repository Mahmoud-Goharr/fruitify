import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruitify/core/helper/get_dummy_product.dart';
import 'package:fruitify/core/widgets/best_selling_grid_view.dart';
import 'package:fruitify/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else if (state is ProductsLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
