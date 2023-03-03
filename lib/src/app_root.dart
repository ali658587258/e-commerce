
import 'package:commerce/blocs/about_us_cubit/about_us_cubit.dart';
import 'package:commerce/blocs/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:commerce/blocs/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:commerce/blocs/login_out_cubit/login_out_cubit.dart';
import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/blocs/wish_list_cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/onboarding_carousel.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginOutCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context)=>WishListCubit()),
        BlocProvider(create: (context) => AddToCartCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context)=>AboutUsCubit()..aboutUs())

      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context,child){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: OnboardingCarousel(),
            );
          }
      ),
    );
  }
}
