
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/e-commerce/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../components/cart_item.dart';
import '../../components/custim_text.dart';
import '../../components/custom_appBar.dart';
import '../../components/custom_button.dart';
import '../../src/app_color.dart';
import 'create_order_screen.dart';

class CartScreen extends StatelessWidget {
  int totalPrice = 0;
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: SafeArea(
        child: BlocConsumer<AddToCartCubit, AddToCartState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AddToCartCubit.get(context);
            return cubit.pList!.length <= 1
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "No Item in cart",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                            onPressed: () {
                              AppNavigator.customNavigator(
                                  context: context,
                                  screen: HomeScreen(),
                                  finish: false);
                            },
                            child: const Text("Back"))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomAppBar(
                          text: "Cart",
                          isCartScreen: true,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: false,
                              itemBuilder: (context, index) {
                                totalPrice += cubit.pList![index + 1].price!;
                                print("hii");
                                return CartItem(
                                  index: index,
                                  name: cubit.pList![index + 1].name,
                                  price: cubit.pList![index + 1].price,
                                  image: cubit.pList![index + 1].image,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 0.3,
                                  color: AppColor.kGreyColor,
                                );
                              },
                              itemCount: cubit.pList!.length - 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomText(
                                text: "Total Price is ${cubit.totalPrice} EGP",
                                color: AppColor.kRedColor,
                                fontSize: 18.sp,
                              ),
                            ),
                            CustomButton(
                                function: () {
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: CreateOrderScreen(),
                                      finish: false);
                                },
                                textColor: AppColor.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                colorContainer: AppColor.KMainColor,
                                radiusCircular: 6.r,
                                width: 80.w,
                                hight: 30.h,
                                text: "Checkout")
                          ],
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
