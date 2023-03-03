import 'package:commerce/blocs/about_us_cubit/about_us_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutUsCubit,AboutUsState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AboutUsCubit.get(context);

        return Scaffold(

          body:
          cubit.aboutUsModel == null ?
          Center(child: CircularProgressIndicator()):
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
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
                            icon: Icon(Icons.keyboard_backspace)
                        ),
                      ),
                    ),
                    Text('About us',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),)

                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r)),

                    child: Column(
                      children: [
                        Image.asset('assets/images/about2.png'),

                        Padding(
                          padding:  EdgeInsets.only(top: 10.h,right: 10.w,left: 10.h),
                          child: Text(
                            'we are portatile company',
                            style: TextStyle(fontSize: 24.sp,color: Colors.blue),
                          ),
                        ),


                        Padding(
                          padding:  EdgeInsets.only(top: 10.h,right: 10.w,left: 20.w,bottom: 20.h),
                          child: Text(
                            cubit.aboutUsModel!.data!.description!,
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
