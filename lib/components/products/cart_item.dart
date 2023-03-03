
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../blocs/favorite_cubit/cubit/favorite_cubit.dart';
import '../../core/toast/toast_config.dart';
import '../../enums/toast_state.dart';
import '../../src/app_color.dart';
import '../custim_text.dart';
import '../custom_button.dart';

class CartItem extends StatelessWidget {
  String? name, image;
  int? price, index, id;

  bool isWishListScreen;
  CartItem(
      {super.key,
      this.image,
      this.name,
      this.id,
      this.price,
      this.index,
      this.isWishListScreen = false});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is RemoveFromSucssesState) {
          ToastConfig.showToast(
              msg: "Removed", toastStates: ToastStates.Success);
        }
        if (state is RemoveFromCartErrorState) {
          ToastConfig.showToast(
              msg: "Removed", toastStates: ToastStates.Success);
        }
      },
      builder: (context, state) {
        var cubit = AddToCartCubit.get(context);
        return BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is RemoveFavoriteSucssesState) {
              ToastConfig.showToast(
                  msg: "Removed", toastStates: ToastStates.Success);
            }
          },
          builder: (context, state) {
            var favoriteCubit = FavoriteCubit.get(context);
            return Container(
              height: 80.h,
              width: double.infinity,
              child: Row(
                children: [
                  Image.network(
                    'https://m.media-amazon.com/images/I/61UY5LzzA0L._AC_UF1000,1000_QL80_.jpg',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name ?? "NuLL",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: "${price} EGP",
                        fontSize: 18.sp,
                        color: AppColor.kRedColor,
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CustomButton(
                          function: () {
                            isWishListScreen
                                ? favoriteCubit.removeFavorite(id: id!)
                                : cubit.removeFromCart(index!);
                          },
                          textColor: AppColor.kWhiteColor,
                          fontWeight: FontWeight.bold,
                          colorContainer: AppColor.kRedColor,
                          radiusCircular: 0,
                          width: 100.w,
                          hight: 30.h,
                          text: "Remove !"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
