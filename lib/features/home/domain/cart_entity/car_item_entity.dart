import 'package:equatable/equatable.dart';
import 'package:fruitify/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quanitty;
  }

  void increasQuantity() {
    quanitty++;
  }

  void decreasQuantity() {
    if (quanitty > 1) {
      quanitty--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
