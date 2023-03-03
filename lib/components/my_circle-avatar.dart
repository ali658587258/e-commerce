import 'package:commerce/src/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCircleAvatar extends StatelessWidget {
  final function;
  final String image;


  MyCircleAvatar({required this.function, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h,right: 10.w,left: 10.w),
      child: GestureDetector(
        onTap: function,
        child: CircleAvatar(
          radius: 25.r,
          child: Image.asset(image,height: 30.h,),
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
