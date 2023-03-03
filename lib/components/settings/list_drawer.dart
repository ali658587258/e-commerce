import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/login_out_cubit/login_out_cubit.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/naviagtion.dart';
import '../../enums/toast_state.dart';
import '../../screens/Authentication/login_screen.dart';
import '../../screens/products/about_page_screen.dart';
import '../../screens/products/cart_screen.dart';
import '../../screens/products/categories_screen.dart';
import '../../screens/setting/contact_us_screenn.dart';
import '../../screens/products/wish_list_screen.dart';
import '../../screens/profile/update_profile_screen.dart';
import '../../src/app_color.dart';
import 'card_drawer.dart';

class ListDrawer extends StatelessWidget {
  const ListDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              color: AppColor.KMainColor,
              height: 200.h,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 30.w,right: 20.w),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage('assets/images/logo.png',),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('name',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                      Padding(
                        padding:  EdgeInsets.only(top: 10.h),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right: 8.w,),
                              child: Text('Edit',style: TextStyle(fontSize: 16,color: Colors.white),),
                            ),
                            IconButton(
                                onPressed: (){
                                  AppNavigator.customNavigator(context: context, screen: UpdateProfileScreen(), finish: false);
                                },
                                icon: Icon(Icons.edit,color: Colors.white,size: 15,))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
          ),
          CardDrawer(
              function: (){
                AppNavigator.customNavigator(
                    context: context,
                    screen: CartScreen(),
                    finish: false);
              },
              iconData: Icons.shopping_cart_outlined,
              text: 'Cart'
          ),
          CardDrawer(
              function: (){
                AppNavigator.customNavigator(
                    context: context,
                    screen: WishListScreen(),
                    finish: false);
              },
              iconData: Icons.favorite_border,
              text: 'Wish List'
          ),
          CardDrawer(
              function: (){},
              iconData: Icons.shopping_bag_outlined,
              text: 'My Orders'
          ),
          CardDrawer(
              function: (){
                AppNavigator.customNavigator(
                    context: context,
                    screen: ContactUsScreen(),
                    finish: false
                );
              },
              iconData: Icons.phone,
              text: 'Content us'
          ),
          CardDrawer(
              function: (){
                AppNavigator.customNavigator(context: context, screen: AboutPageScreen(), finish: false);
              },
              iconData: Icons.info_outline,
              text: 'About us'
          ),
          CardDrawer(
              function: (){
                AppNavigator.customNavigator(context: context, screen: CategoriesScreen(), finish: false);
              },
              iconData: Icons.grid_view,
              text: 'Categories'
          ),
          BlocConsumer<LoginOutCubit,LoginOutState>(
              builder: (context,state){
                var cubitLoginOut = LoginOutCubit.get(context);
                return Padding(
                  padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
                  child: GestureDetector(
                    onTap: (){
                      cubitLoginOut.loginOut();
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout,color: Colors.red,),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text('Log out',style: TextStyle(color: Colors.red),)
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
              },
              listener: (context,state){
                if(state is LoginOutSuccessState){
                  ToastConfig.showToast(msg: 'Login Out Success', toastStates: ToastStates.Success);

                  AppNavigator.customNavigator(context: context, screen: LoginScreen(), finish: true);
                }
              })



        ],
      ),
    );
  }
}
