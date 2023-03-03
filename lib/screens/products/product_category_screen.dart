import 'package:commerce/blocs/product_category_cubit/product_category_cubit.dart';
import 'package:commerce/screens/products/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/products/main_products_container.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/naviagtion.dart';
import '../../enums/toast_state.dart';
import '../../src/app_color.dart';

class ProductCategoryScreen extends StatelessWidget {
  final String id;
  final String name;


  ProductCategoryScreen({required this.id,required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCategoryCubit()..getAllProduct(id: id),
      child: BlocConsumer<ProductCategoryCubit,ProductCategoryState>(
          listener: (context,state){

          },
          builder: (context,state){
            var cubit = ProductCategoryCubit.get(context);
            return Scaffold(
              body: state is ProductCategoryLoadingState 
                  ? Center(child: CircularProgressIndicator())
                  :
              Padding(
                padding:  EdgeInsets.all(15.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_sharp)
                            ),
                          ),
                        ),
                        Text('Product',style: TextStyle(fontSize: 22.sp),)

                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('${name}',style: TextStyle(fontSize: 20.sp,color: Colors.blue),)),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
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
                      ),
                    )

                  ],
                ),
              ),
            );
          }),
    );
  }
}
