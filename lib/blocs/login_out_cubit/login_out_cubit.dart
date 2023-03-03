import 'package:bloc/bloc.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'login_out_state.dart';

class LoginOutCubit extends Cubit<LoginOutState> {
  LoginOutCubit() : super(LoginOutInitial());
  static LoginOutCubit get(context) => BlocProvider.of(context);

  loginOut(){
    emit(LoginOutLoadingState());
    DioHelper.postData(
        url: 'logout',
        data: {},
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      emit(LoginOutSuccessState());
      print('suc');
    }).catchError((error){
      emit(LoginOutErrorState());
    });
  }
}
