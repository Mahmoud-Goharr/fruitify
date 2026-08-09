import 'package:fruitify/core/entities/product_entity.dart';

import 'favorite_item_entity.dart';

class FavoriteEntity {
  List<FavoriteItemEntity> favoriteItems;

  FavoriteEntity({required this.favoriteItems});

  void addFavorite(FavoriteItemEntity item) {
    if (!isExist(item.productEntity)) {
      favoriteItems.add(item);
    }
  }

  void removeFavorite(ProductEntity product) {
    favoriteItems.removeWhere(
      (item) => item.productEntity == product,
    );
  }

  bool isExist(ProductEntity product) {
    for (var item in favoriteItems) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }
}