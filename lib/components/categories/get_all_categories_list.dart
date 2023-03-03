import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/products/product_category_screen.dart';

class GetAllCategoriesList extends StatelessWidget {
  const GetAllCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocProvider(
        create: (context) => ProductsCubit()..getAllCategories(),
        child: BlocConsumer<ProductsCubit,ProductsState>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = ProductsCubit.get(context);
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: false,
                itemCount: cubit.categoriesModels.data?.length ?? 0 ,
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.h),
                    child: Material(
                      elevation: 2,
                      child: GestureDetector(
                        onTap: (){
                          AppNavigator.customNavigator(
                              context: context,
                              screen: ProductCategoryScreen(id: '${cubit.categoriesModels!.data![index].id!}',
                                  name: cubit.categoriesModels.data![index].name!),
                              finish: false);
                        },
                        child: Container(
                          width: 120.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              color: Colors.grey[300]
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/3128304.png',height: 80.h,width: 80.w,),
                              Text(cubit.categoriesModels.data![index].name!)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(
              width: 10.w,
            );},
            );

          },
        ),
      ),
    );
  }
}
