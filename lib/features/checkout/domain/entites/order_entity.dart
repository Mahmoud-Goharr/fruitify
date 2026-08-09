import 'package:fruitify/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruitify/features/home/domain/cart_entity/cart_entity.dart';

class OrderInputEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderInputEntity({
    required this.cartEntity,
    required this.uID,
    required this.shippingAddressEntity,
    this.payWithCash,
  });

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uID, cartEntity: $cartEntity, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity}';
  }
}
