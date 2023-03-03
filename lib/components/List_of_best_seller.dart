import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/e-commerce/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../src/app_color.dart';
import 'main_products_container.dart';

class ListOfBestSeller extends StatelessWidget {
  const ListOfBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BlocProvider(
        create: (context) => ProductsCubit()..getAllProducts(),
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProductsCubit.get(context);
            return state is GetAllProductsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColor.KMainColor,
                  ))
                : ListView.separated(
                    shrinkWrap: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var mydata = cubit.productsModel.product![index];
                      return MainProductsContainer(
                        product: cubit.productsModel.product![index],
                        id: mydata.id!,
                        imageUrl: mydata.image!,
                        name: mydata.name!,
                        price: mydata.price!,
                        function: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: ProductScreen(
                                  product: cubit.productsModel.product![index]),
                              finish: false);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                    itemCount: 5);
          },
        ),
      ),
    );
  }
}
