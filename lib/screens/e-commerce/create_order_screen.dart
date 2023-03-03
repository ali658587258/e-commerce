import 'package:commerce/screens/e-commerce/payment/toggle_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custim_text.dart';
import '../../components/custom_button.dart';
import '../../components/text_field_authen.dart';
import '../../core/utils/naviagtion.dart';
import '../../src/app_color.dart';
import 'cart_screen.dart';

class CreateOrderScreen extends StatelessWidget {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  CreateOrderScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              AppNavigator.customNavigator(context: context,
                  screen: CartScreen(),
                  finish: false);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.kBlackColor,
            )),
        title: CustomText(
          text: "Create order".toUpperCase(),
          color: AppColor.KMainColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomText(
                  text: "Please complete your information to complete your order",
                  fontSize: 25.sp,
                ),
                TextFieldAuthen(label: 'First name', isPassword: false, iconData: Icons.abc, controller: firstNameController),
                TextFieldAuthen(label: 'Last name', isPassword: false, iconData: Icons.abc, controller: lastNameController),
                TextFieldAuthen(label: 'Email', isPassword: false, iconData: Icons.abc, controller: emailNameController),
                TextFieldAuthen(label: 'Phone', isPassword: false, iconData: Icons.abc, controller: phoneNameController),
                TextFieldAuthen(label: 'Address', isPassword: false, iconData: Icons.abc, controller: addressNameController),

                CustomButton(
                  function: () {
                    AppNavigator.customNavigator(
                        context: context,
                        screen: ToggleScreen(
                            email: emailNameController.text,
                            address: addressNameController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phone: phoneNameController.text),
                        finish: false
                    );
                  },
                  colorContainer: AppColor.KMainColor,
                  radiusCircular: 4,
                  width: double.infinity,
                  hight: 40.h,
                  text: "Create order",
                  textColor: AppColor.kWhiteColor,
                  fontSize: 20.sp,
                ),

              ],
            ),
          ),
      ),
    );
  }
}
