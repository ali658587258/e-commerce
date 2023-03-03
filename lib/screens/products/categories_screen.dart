import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/products/product_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getAllCategories(),
      child: BlocConsumer<ProductsCubit,ProductsState>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit = ProductsCubit.get(context);

          return Scaffold(
            body: state is GetAllCategoriesLoadingState ?
            Center(child: CircularProgressIndicator()): 
            Padding(
              padding:  EdgeInsets.all(10.r),
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
                      Text('Categories',style: TextStyle(fontSize: 22.sp),)

                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Text('All Categories',style: TextStyle(fontSize: 20.sp,color: Colors.blue),)),
                  Expanded(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: cubit.categoriesModels.data!.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.0.h,vertical: 4.w),
                            child: GestureDetector(
                              onTap: (){
                                AppNavigator.customNavigator(
                                    context: context,
                                    screen: ProductCategoryScreen(
                                      id: cubit.categoriesModels.data![index].id!.toString(),
                                      name: cubit.categoriesModels.data![index].name!,
                                    ),
                                    finish: false);
                              },
                              child: Material(
                                elevation: 2,
                                child: Container(
                                  width: 100.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.zero,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/3128304.png',height: 110.h,width: 80.w,),
                                      Text(cubit.categoriesModels.data![index].name!)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  )
                  ],
              ),
            )
          );
        },
      ),
    );
  }
}
