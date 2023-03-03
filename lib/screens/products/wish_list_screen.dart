import 'package:commerce/core/utils/naviagtion.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/favorite_cubit/cubit/favorite_cubit.dart';
import '../../components/products/cart_item.dart';
import '../../components/custim_text.dart';
import '../../components/settings/custom_appBar.dart';
import '../../src/app_color.dart';
import 'home_screen.dart';

class WishListScreen extends StatelessWidget {
  int totalPrice = 0;
  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: SafeArea(
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = FavoriteCubit.get(context);
            return cubit.favoriteList.length <= 1
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "No Item in you wish list ",
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
                          text: "Whis List ",
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
                                return CartItem(
                                  index: index,
                                  isWishListScreen: true,
                                  id: cubit.favoriteList[index + 1].id,
                                  name: cubit.favoriteList[index + 1].name,
                                  price: cubit.favoriteList[index + 1].price,
                                  image: cubit.favoriteList[index + 1].image,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 0.3,
                                  color: AppColor.kGreyColor,
                                );
                              },
                              itemCount: cubit.favoriteList.length - 1),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
