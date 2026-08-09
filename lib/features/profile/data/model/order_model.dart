import 'package:fruitify/core/enums/order_enum.dart';
import 'package:fruitify/features/checkout/data/models/order_product_model.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';

class UserOrderModel {
  final double totalPrice;
  final String uId;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;
  final String date;

  UserOrderModel({
    required this.totalPrice,
    required this.uId,
    required this.status,
    required this.orderID,
    required this.orderProducts,
    required this.paymentMethod,
    required this.date,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) {
    return UserOrderModel(
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uId: json['uId'],
      status: json['status'],
      orderID: json['orderId'],
      orderProducts: (json['orderProducts'] as List)
          .map(
            (e) => OrderProductModel.fromJson(e),
          )
          .toList(),
      paymentMethod: json['paymentMethod'],
      date: json['date'],
    );
  }

  UserOrderEntity toEntity() {
    return UserOrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      orderID: orderID,
      status: fetchEnum(),
      orderProducts: orderProducts
          .map((e) => e.toEntity())
          .toList(),
      paymentMethod: paymentMethod,
      date: date,
    );
  }

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere(
      (e) => e.name == (status ?? 'pending'),
      orElse: () => OrderStatusEnum.pending,
    );
  }
}