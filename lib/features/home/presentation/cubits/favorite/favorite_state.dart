import 'package:equatable/equatable.dart';
import 'package:fruitify/features/home/domain/entites/favorite_entity/favorite_entity.dart';

abstract class FavoriteState extends Equatable {
  final FavoriteEntity favoriteEntity;
  const FavoriteState(this.favoriteEntity);

  @override
  List<Object?> get props => [favoriteEntity];
}

class FavoriteInitial extends FavoriteState {
  const FavoriteInitial(super.entity);
}

class FavoriteItemAdded extends FavoriteState {
  const FavoriteItemAdded(super.entity);
}

class FavoriteItemRemoved extends FavoriteState {
  const FavoriteItemRemoved(super.entity);
}