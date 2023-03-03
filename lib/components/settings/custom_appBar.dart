import 'package:commerce/core/utils/naviagtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/products/cart_screen.dart';
import '../../screens/products/home_screen.dart';
import '../../src/app_color.dart';
import '../custim_text.dart';

class CustomAppBar extends StatelessWidget {
  String text;
  bool isCartScreen;
  CustomAppBar({required this.text, this.isCartScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kWhiteColor,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                AppNavigator.customNavigator(context: context, screen: HomeScreen(), finish: true);
              },
              icon: const Icon(Icons.arrow_back)),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomText(
              text: text,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          isCartScreen
              ? SizedBox()
              : IconButton(
              onPressed: () {
                AppNavigator.customNavigator(context: context, screen: CartScreen(), finish: false);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColor.kGreyColor,
              )),
        ],
      ),
    );
  }
}
