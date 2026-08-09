import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_network_image.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:fruitify/features/home/presentation/cubits/favorite/favorite_state.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 230,
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final isFavorite = context.read<FavoriteCubit>().isFavorite(
                  productEntity,
                );

                return IconButton(
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite(productEntity);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                );
              },
            ),
          ),

          // Product
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Flexible(
                  child: CustomNetworkImage(imageUrl: productEntity.imageUrl),
                ),

                const SizedBox(height: 24),

                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),

                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price} جنيه ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),

                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
