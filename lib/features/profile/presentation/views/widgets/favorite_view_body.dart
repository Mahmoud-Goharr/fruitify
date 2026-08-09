import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/widgets/best_selling_grid_view.dart';
import 'package:fruitify/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:fruitify/features/home/presentation/cubits/favorite/favorite_state.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final products = state.favoriteEntity.favoriteItems
            .map((e) => e.productEntity)
            .toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
          child: CustomScrollView(
            slivers: [
              ProductsGridView(products: products),
            ],
          ),
        );
      },
    );
  }
}