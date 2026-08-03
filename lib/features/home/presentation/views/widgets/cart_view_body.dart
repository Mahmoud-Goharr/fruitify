import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:fruitify/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruitify/features/home/presentation/views/widgets/custom_cart_button.dart';

import '../../../../../constants.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: kTopPaddding),
                  customAppBar(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  const SizedBox(height: 16),
                  const CartHeader(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            CarItemsList(
              carItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}
