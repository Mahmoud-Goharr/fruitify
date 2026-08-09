import 'package:equatable/equatable.dart';
import 'package:fruitify/core/entities/product_entity.dart';

class FavoriteItemEntity extends Equatable {
  final ProductEntity productEntity;

  const FavoriteItemEntity({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}