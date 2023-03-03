import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_color.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  FontWeight? fontWeight;
  int? maxLines;
  var fontSize;
  CustomText(
      {required this.text,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 13,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppColor.KMainColor),
    );
  }
}
