import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';
import 'package:fruitify/features/profile/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/order_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderModels});

  final List<UserOrderEntity> orderModels;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<UserOrdersCubit>().getUserOrders();
      },
      child: ListView.builder(
        itemCount: orderModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: OrderItemWidget(order: orderModels[index]),
          );
        },
      ),
    );
  }
}
