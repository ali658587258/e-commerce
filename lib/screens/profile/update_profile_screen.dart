import 'package:commerce/blocs/Update_profile_cubit/update_profile_cubit.dart';
import 'package:commerce/components/my_buttom.dart';
import 'package:commerce/components/text_field_authen.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/toast/toast_config.dart';
import '../../enums/toast_state.dart';
import '../../service/sp_helper/cache_helper.dart';
import '../../service/sp_helper/cache_keys.dart';

class UpdateProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit,UpdateProfileState>(
        listener: (context,state){
          if ( state is UpdateProfileSuccessState){
            ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          var cubit = UpdateProfileCubit.get(context);
          return Scaffold(
            body: Padding(
              padding:  EdgeInsets.all(20.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_sharp)
                          ),
                        ),
                      ),
                      Text('Update Profile',style: TextStyle(fontSize: 22.sp),)

                    ],
                  ),

                  SizedBox(
                    height: 100.h,
                  ),

                  TextFieldAuthen(
                      label: 'Address',
                      isPassword: false,
                      iconData: Icons.home,
                      controller: cubit.addressController),
                  TextFieldAuthen(
                      label: 'Phone',
                      isPassword: false,
                      iconData: Icons.phone,
                      controller: cubit.phoneController),
                  TextFieldAuthen(
                      label: 'Password',
                      isPassword: true,
                      iconData: Icons.password,
                      controller: cubit.passwordController),
                  SizedBox(
                    height: 50.h,
                  ),

                  MyButton(
                      'Update Profile',
                          (){
                        cubit.updateProfile(id: SharedPreferencesHelper.getData(key: SharedPreferencesKey.id).toString());
                      }
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
