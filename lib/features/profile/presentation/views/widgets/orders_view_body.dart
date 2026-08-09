import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/orders_items_list_view.dart';

import 'package:gap/gap.dart';


class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<UserOrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
      
          const SizedBox(
            height: 16,
          ),
          Expanded(child: OrdersItemsListView(orderModels: orders)),
          Gap(24),
        ],
      ),
    );
  }
}
