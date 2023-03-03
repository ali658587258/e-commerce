
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_color.dart';
import '../custim_text.dart';

class ContactusItem extends StatelessWidget {
  IconData icon;
  String mainText, subText;

  ContactusItem(
      {super.key,
      required this.icon,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColor.kGreyColor.withOpacity(0.8),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: 18.sp,
                  text: mainText,
                  color: AppColor.kBlackColor,
                ),
                CustomText(text: subText)
              ],
            )
          ],
        ),
      ),
    );
  }
}
