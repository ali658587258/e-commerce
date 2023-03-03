import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/components/my_buttom.dart';
import 'package:commerce/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_color.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  ProductScreen({
  required this.product
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit,ProductsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ProductsCubit.get(context);
          return Scaffold(
            body:
            Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/home – 35.png'
                        ),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(product.name!  ,style: TextStyle(fontSize: 24.sp),),
                      SizedBox(
                        height: 10.h,
                      ),

                      Text('Discrabtion',style: TextStyle(color: Colors.blue),),

                      Text('screen : 6.1 inch',style:TextStyle(fontSize: 12.sp),),
                      Text('color : silver',style:TextStyle(fontSize: 12.sp),),
                      Text('Battery Power Rating  : 4250',style:TextStyle(fontSize: 12.sp),),
                      Text('paris : ${product.price!} ',style:TextStyle(fontSize: 12.sp),),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 32.h,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(AppColor.KMainColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                )
                            ),
                            onPressed: (){},
                            child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp),)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
