import 'package:commerce/blocs/login_cubit/login_cubit.dart';
import 'package:commerce/screens/Authentication/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_buttom.dart';
import '../../components/my_circle-avatar.dart';
import '../../components/text_field_authen.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/naviagtion.dart';
import '../../enums/toast_state.dart';
import '../../src/app_color.dart';
import '../products/home_screen.dart';

class LoginScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
          if(state is LoginSuccessState){
            ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
            AppNavigator.customNavigator(context: context, screen: HomeScreen(), finish: true);
          }
        },
        builder: (context,state){
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 50.h,right: 20.w,left: 20.w),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo.png',height: 150.h,),
                        Text('Welcome to portatile',style: TextStyle(color: AppColor.KMainColor,fontSize: 26.h,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.h,),
                        Text('Please login to your account',style: TextStyle(fontSize: 18.h),),
                        SizedBox(height: 10.h,),
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
                                return "Enter correct phone number";
                              }else{
                                return null;
                              }
                            }
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: (){},
                              child: Text('forgot password',style: TextStyle(color: Colors.grey),)
                          ),
                        ),

                        SizedBox(height: 20.h,),
                        MyButton('Continue', (){
                          if(formKey.currentState!.validate()){
                            cubit.login();
                            cubit.emailController.clear();
                            cubit.passwordController.clear();
                          }

                        }),
                        SizedBox(height: 20.h,),
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
                        SizedBox(height: 10.h,),
                        TextButton(
                            onPressed: (){},
                            child: Text('Don‘t have account?',style: TextStyle(color: Colors.grey),)
                        ),
                        MyButton('Sign Up', (){
                          AppNavigator.customNavigator(context: context, screen: SignUpScreen(), finish: false);
                        }),

                      ],
                    ),
                  ),
                )
              ),
            ),
          );
        },),
    );;
  }
}
