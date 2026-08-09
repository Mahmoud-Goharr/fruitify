import 'package:fruitify/core/entities/order_product_entity.dart';
import 'package:fruitify/features/home/domain/cart_entity/car_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.name,
      code: cartItemEntity.productEntity.code,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.quanitty,
    );
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}