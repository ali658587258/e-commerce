import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/responds/products/products_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  List<Product> favoriteList = [Product()];
  bool isFavorite = false;

  addToFavorite(Product product) {
    emit(AddFavoriteLoadingState());
    int check = -1;
    try {
      for (int i = 1; i < favoriteList.length; i++) {
        if (product.name == favoriteList[i].name) {
          check = 0;
          emit(AddFavoriteAllReadyAddedState());
          break;
        }
      }
      if (check == -1) {
        favoriteList.add(product);
        emit(AddFavoriteSucssesState());
      }
    } catch (error) {
      emit(AddFavoriteErrorState());
    }
  }

  removeFavorite({required int id}) {
    emit(RempoveFavoriteLoadingState());
    try {
      for (int i = 1; i < favoriteList.length; i++) {
        if (favoriteList[i].id == id) {
          favoriteList.removeAt(i);
          emit(RemoveFavoriteSucssesState());
          break;
        }
      }
    } catch (error) {
      emit(RemoveFavoriteErrorState());
    }
  }
}
