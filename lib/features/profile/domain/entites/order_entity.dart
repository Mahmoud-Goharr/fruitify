
import 'package:fruitify/core/entities/order_product_entity.dart';
import 'package:fruitify/core/enums/order_enum.dart';

class UserOrderEntity {
  final double totalPrice;
  final String uId;
  final String orderID;
  final String date;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatusEnum status;
  UserOrderEntity(
      {required this.totalPrice,
      required this.uId,
      required this.orderID,
      required this.status,
      required this.orderProducts,
      required this.paymentMethod, required this.date});
}

// payment method
