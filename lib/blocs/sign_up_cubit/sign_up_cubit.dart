import 'package:bloc/bloc.dart';
import 'package:commerce/models/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
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


  signUp(){
    emit(SignUpLoadingState());
    DioHelper.postData(
        url: 'register',
        data: {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text
        },
    ).then((value){
      emit(SignUpSuccessState());
      authentication = Authentication.fromJson(value.data);
      SharedPreferencesHelper.saveData( key: SharedPreferencesKey.token, value:authentication!.data!.accessToken! );

    }).catchError((error){
      emit(SignUpErrorState());
    });
  }




}
