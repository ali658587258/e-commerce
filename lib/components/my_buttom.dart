import 'package:commerce/src/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final function;


  MyButton(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
          onPressed: function,
          child: Text(text,style: TextStyle(color: AppColor.kWhiteColor),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.KMainColor)
        ),
      ),
    );
  }
}
