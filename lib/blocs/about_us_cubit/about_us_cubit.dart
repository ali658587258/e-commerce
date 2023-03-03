import 'package:bloc/bloc.dart';
import 'package:commerce/models/about_us.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());
  static AboutUsCubit get(context) => BlocProvider.of(context);
  AboutUsModel? aboutUsModel;
  
  aboutUs(){
    emit(AboutUsLoadingState());
    DioHelper.getData(
        url: 'about-page',
    ).then((value){
      aboutUsModel =AboutUsModel.fromJson(value.data);
      emit(AboutUsSuccessState());
    }).catchError((error){
      emit(AboutUsErrorState());
      print(error);
    });
  }
}
