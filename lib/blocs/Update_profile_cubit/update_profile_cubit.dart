import 'package:bloc/bloc.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/responds/auth/authentication.dart';
import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  updateProfile({required String id}){
    emit(UpdateProfileLoadingState());
    DioHelper.postData(
        url: 'profile/$id',
        data: {
          '_method':'PUT',
          'address':addressController.text,
          'phone':phoneController.text,
          'password':passwordController.text
        },
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value){
      emit(UpdateProfileSuccessState());
    }).catchError((error){
      emit(UpdateProfileErrorState());
    });
  }
  
  profile(){
    DioHelper.getData(url: 'profile').then((value){}).catchError((error){});
  }

}
