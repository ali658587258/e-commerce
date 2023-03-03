import 'package:bloc/bloc.dart';
import 'package:commerce/models/categories_models.dart';
import 'package:commerce/models/products_model.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  ProductsModel productsModel = ProductsModel();
  CategoriesModels categoriesModels = CategoriesModels();

  getAllProducts(){
    emit(GetAllProductsLoadingState());
    DioHelper.getData(
        url: 'products',
      token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      productsModel = ProductsModel.fromJson(value.data);
      emit(GetAllProductsSuccessState());
    }).catchError((error){
      emit(GetAllProductsErrorState());
    });
  }


  productPagination(){
    DioHelper.getData(
        url: 'product/list?page_size=5',
        token:
        SharedPreferencesHelper.getData( key: SharedPreferencesKey.token)
    ).then((value){


    }).catchError((error){

    });
  }

  getAllCategories(){
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(
        url: 'categories',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)

    ).then((value){
      categoriesModels = CategoriesModels.fromJson(value.data);
      emit(GetAllCategoriesSuccessState());
    }).catchError((error){
      emit(GetAllCategoriesErrorState());
    });
  }
  
  product({required String id}){
    emit(ProductsLoadingState());
    DioHelper.getData(
        url: 'products/$id',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      productsModel = ProductsModel.fromJson(value.data);
      emit(ProductsSuccessState());
    }).catchError((error){
      emit(ProductsErrorState());
    });
  }
}
