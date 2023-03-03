import 'package:bloc/bloc.dart';
import 'package:commerce/models/responds/categories/product_category_model.dart';
import 'package:commerce/models/responds/products/products_model.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryInitial());
  
  static ProductCategoryCubit get(context) => BlocProvider.of(context);
  ProductsModel productsModel = ProductsModel();
  
  getAllProduct({required String id}){
    emit(ProductCategoryLoadingState());
    DioHelper.getData(
        url: 'product?category=$id',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      productsModel = ProductsModel.fromJson(value.data);
      emit(ProductCategorySuccessState());
    }).catchError((error){
      emit(ProductCategoryErrorState());
    });
  }
}
