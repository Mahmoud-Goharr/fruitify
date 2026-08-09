import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';

import '../../../../../core/enums/order_enum.dart';

class OrderItemWidget extends StatelessWidget {
  final UserOrderEntity order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    String formatedDate() {
      DateTime date = DateTime.parse(order.date);
      String formatted1 = (DateFormat.yMMMd().format(date));
      return formatted1;
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Price
            Row(
              children: [
                Text(
                  'الحساب: ${order.totalPrice.toStringAsFixed(2)}\$',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                // Order Status
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: order.status == OrderStatusEnum.pending
                        ? Colors.orange
                        : order.status == OrderStatusEnum.accepted
                        ? Colors.green
                        : order.status == OrderStatusEnum.delivered
                        ? Colors.blue
                        : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status.name,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),

            Text(
              'طريقة الدفع: ${order.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            Text(
              'تاريخ الاوردر: ${formatedDate()}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Order Products
            const Text(
              'المنتجات:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderProducts.length,
              itemBuilder: (context, index) {
                final product = order.orderProducts[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => const SizedBox(
                      width: 24,
                      height: 24,
                      child: CupertinoActivityIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'الكمية: ${product.quantity} | السعر: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
