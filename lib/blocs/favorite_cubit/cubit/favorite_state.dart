part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class AddFavoriteLoadingState extends FavoriteState {}

class AddFavoriteErrorState extends FavoriteState {}

class AddFavoriteSucssesState extends FavoriteState {}

class AddFavoriteAllReadyAddedState extends FavoriteState {}

class RempoveFavoriteLoadingState extends FavoriteState {}

class RemoveFavoriteErrorState extends FavoriteState {}

class RemoveFavoriteSucssesState extends FavoriteState {}
