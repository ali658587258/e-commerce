import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDrawer extends StatelessWidget {
  final IconData iconData;
  final String text;
  final function;

  CardDrawer({required this.iconData, required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
      child: GestureDetector(
        onTap: function,
        child: Column(
          children: [
            Row(
              children: [
                Icon(iconData),
                SizedBox(
                  width: 15.w,
                ),
                Text(text)
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,

            )
          ],
        ),
      ),
    );
  }
}
