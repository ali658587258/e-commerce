import 'package:commerce/components/my_buttom.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/Authentication/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOnBoarding extends StatelessWidget {
  String text;
  String urlImage;
  bool isLast = false;
  CardOnBoarding(
      {required this.text, required this.urlImage, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlImage),
            SizedBox(height: 70.h,),

            Text(
              text,
              style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            isLast == true
                ? MyButton(
                'Get start',
                    (){
                  AppNavigator.customNavigator(context: context, screen: SignUpScreen(), finish: true);
                    }): Container(),
          ],
        ),
      ),
    );
  }
}
