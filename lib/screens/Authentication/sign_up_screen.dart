import 'package:commerce/blocs/Payment_cubit/cubit/k_y_c_cubit.dart';
import 'package:commerce/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'package:commerce/components/my_buttom.dart';
import 'package:commerce/components/my_circle-avatar.dart';
import 'package:commerce/components/text_field_authen.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/Authentication/login_screen.dart';
import 'package:commerce/src/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/toast/toast_config.dart';
import '../../enums/toast_state.dart';
import '../products/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KYCCubit(),
      child: BlocConsumer<KYCCubit,KYCState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: BlocProvider(
              create: (context) => SignUpCubit(),
              child: BlocConsumer<SignUpCubit,SignUpState>(
                listener: (context,state){
                  if(state is SignUpSuccessState){
                    ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
                    AppNavigator.customNavigator(context: context, screen: HomeScreen(), finish: true);
                  }
                  if (state is SignUpErrorState){
                    ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
                  }
                },
                builder: (context,state){
                  var cubit = SignUpCubit.get(context);
                  return  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top: 50.h,right: 20.w,left: 20.w),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Image.asset('assets/images/logo.png',height: 150.h,),
                              Text('Welcome to portatile',style: TextStyle(color: AppColor.KMainColor,fontSize: 26.h,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10.h,),
                              Text('Please sign up to join us',style: TextStyle(fontSize: 18.h),),
                              SizedBox(height: 10.h,),
                              TextFieldAuthen(
                                  label: 'Full name',
                                  isPassword: false,
                                  iconData: Icons.person,
                                  controller: cubit.nameController,
                                  function: (value){
                                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                                      return "Enter correct name";
                                    }else{
                                      return null;
                                    }
                                  }
                              ),
                              TextFieldAuthen(
                                  label: 'Your email',
                                  isPassword: false,
                                  iconData: Icons.email_outlined,
                                  controller: cubit.emailController,
                                  function: (value){
                                    if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                                      return "Enter correct email";
                                    }else{
                                      return null;
                                    }
                                  }
                              ),
                              TextFieldAuthen(
                                  label: 'Your password',
                                  isPassword: true,
                                  iconData: Icons.lock,
                                  controller: cubit.passwordController,
                                  function: (value){
                                    if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)){
                                      return "Enter correct password";
                                    }else{
                                      return null;
                                    }
                                  }
                              ),
                              SizedBox(height: 30.h,),
                              MyButton('Continue', (){
                                if(formKey.currentState!.validate()){
                                  cubit.signUp();
                                  KYCCubit.get(context).getAuthToken();
                                }
                              }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyCircleAvatar(function: (){
                                    cubit.signInWithFacebook();
                                  }, image: 'assets/images/3128304.png'),
                                  MyCircleAvatar(function: (){}, image: 'assets/images/twitter.png'),
                                  MyCircleAvatar(function: (){
                                    cubit.signInWithGoogle();
                                  }, image: 'assets/images/google.png'),
                                ],
                              ),
                              TextButton(
                                  onPressed: (){},
                                  child: Text('Already have an account?',style: TextStyle(color: Colors.grey),)
                              ),
                              MyButton('Login', (){
                                AppNavigator.customNavigator(context: context, screen: LoginScreen(), finish: false);
                              }),

                            ],
                          ),
                        )
                      ),
                    ),
                  );
                },
              ),
            )
          );
        },),
    );
  }
}
