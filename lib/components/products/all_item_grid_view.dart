import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/naviagtion.dart';
import '../../screens/products/product_screen.dart';
import '../../src/app_color.dart';
import 'main_products_container.dart';

class AllItemGridView extends StatelessWidget {
  const AllItemGridView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductsCubit()..getAllProducts(),
      child: BlocConsumer<ProductsCubit,ProductsState>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit = ProductsCubit.get(context);
          return state is GetAllProductsLoadingState
              ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.KMainColor,
              )) :
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: GridView.builder(
                padding: const EdgeInsets.only(right: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: 40,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.64,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var myData = cubit.productsModel.product![index];
                  return MainProductsContainer(
                      product: cubit.productsModel.product![index],
                      function: () {
                        AppNavigator.customNavigator(
                            context: context,
                            screen: ProductScreen(product: cubit.productsModel.product![index]),
                            finish: false);
                      },
                      id: myData.id!,
                      imageUrl: myData.image!,
                      name: myData.name!,
                      price: myData.price!);
                }),
          );

        },
      ),
    );
  }
}
