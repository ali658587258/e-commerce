import 'package:bloc/bloc.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/responds/company_profile_respond.dart';
import '../../../service/sp_helper/cache_helper.dart';
import '../../../service/sp_helper/cache_keys.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit() : super(CompanyProfileInitial());
  static CompanyProfileCubit get(context) => BlocProvider.of(context);
  CompanyProfileRespond companyProfileRespond = CompanyProfileRespond();
  getCompanyProfile() {
    emit(CompanyProfileLoadingState());
    DioHelper.getData(
            url: '/company-profile',
        token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value) {
      companyProfileRespond = CompanyProfileRespond.fromJson(value.data);
      debugPrint("comapny suc");
      emit(CompanyProfileSuccsessState());
    }).catchError((error) {
      debugPrint("Error $error");
      emit(CompanyProfileErrorState());
    });
  }
}
