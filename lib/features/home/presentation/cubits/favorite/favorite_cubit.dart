import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/features/home/domain/entites/favorite_entity/favorite_entity.dart';
import 'package:fruitify/features/home/domain/entites/favorite_entity/favorite_item_entity.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit()
      : super(
          FavoriteInitial(
            FavoriteEntity(favoriteItems: []),
          ),
        );

  void addToFavorite(ProductEntity product) {
    final favEntity = state.favoriteEntity;
    favEntity.addFavorite(FavoriteItemEntity(productEntity: product));
    emit(FavoriteItemAdded(favEntity));
  }

  void removeFromFavorite(ProductEntity product) {
    final favEntity = state.favoriteEntity;
    favEntity.removeFavorite(product);
    emit(FavoriteItemRemoved(favEntity));
  }

  void toggleFavorite(ProductEntity product) {
    final favEntity = state.favoriteEntity;
    if (favEntity.isExist(product)) {
      favEntity.removeFavorite(product);
      emit(FavoriteItemRemoved(favEntity));
    } else {
      favEntity.addFavorite(FavoriteItemEntity(productEntity: product));
      emit(FavoriteItemAdded(favEntity));
    }
  }

  bool isFavorite(ProductEntity product) {
    return state.favoriteEntity.isExist(product);
  }
}