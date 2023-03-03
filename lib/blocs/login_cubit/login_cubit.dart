import 'package:bloc/bloc.dart';
import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../models/responds/auth/authentication.dart';
import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authentication? authentication;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  login(){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data: {
          "email": emailController.text,
          "password": passwordController.text
        }
    ).then((value){
      authentication = Authentication.fromJson(value.data);
      SharedPreferencesHelper.saveData( key: SharedPreferencesKey.token, value:authentication!.data!.accessToken! );
      SharedPreferencesHelper.saveData( key: SharedPreferencesKey.id, value:authentication!.data!.user!.id! );

      emit(LoginSuccessState());
    }).catchError((error){
      print('Dasrdtfyguhjiokl');
      emit(LoginErrorState());
    });
  }
}
