import 'package:bloc/bloc.dart';
import 'package:commerce/models/wish_list_model.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  static WishListCubit get(context) => BlocProvider.of(context);
  WishListModel? wishListModel;

  viewWishList(){
    emit(WishListLoadingState());
    DioHelper.getData(
        url: 'view-wish-list',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      emit(WishListSuccessState());
      wishListModel = WishListModel.fromJson(value.data);
    }).catchError((error){
      emit(WishListErrorState());
    });
  }
  
  addTOWishList({required String id}){
    emit(AddTOWishListLoadingState());
    DioHelper.postData(
        url: 'add-to-wish-list/$id',
        data: {},
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)

    ).then((value){
      emit(AddTOWishListSuccessState());
    }).catchError((error){
      emit(AddTOWishListErrorState());
    });
  }

  removeFromWishList({required String id}){
    emit(RemoveFromWishListLoadingState());
    DioHelper.deleteData(
        url: 'delete-from-wish-list/$id',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)

    ).then((value){
      emit(RemoveFromWishListSuccessState());
    }).catchError((error){
      emit(RemoveFromWishListErrorState());
    });
  }
}
