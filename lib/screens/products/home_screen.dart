import 'package:commerce/blocs/Payment_cubit/cubit/k_y_c_cubit.dart';
import 'package:commerce/blocs/login_out_cubit/login_out_cubit.dart';
import 'package:commerce/blocs/products_cubit/products_cubit.dart';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/products/List_of_best_seller.dart';
import '../../components/products/all_item_grid_view.dart';
import '../../components/products/custom_row_slider.dart';
import '../../components/fields/custom_serch_filed.dart';
import '../../components/categories/get_all_categories_list.dart';
import '../../components/settings/list_drawer.dart';
import 'cart_screen.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => KYCCubit()..getAuthToken(),
      child: BlocConsumer<KYCCubit,KYCState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: AppColor.kWhiteColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 25.sp,
                  color: AppColor.kGreyColor,
                ),
              ),
              title: SizedBox(
                height: 75.h,
                child: CustomSearchField(
                  lable: 'Search',
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      AppNavigator.customNavigator(
                          context: context,
                          screen: CartScreen(),
                          finish: false
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColor.kGreyColor,
                    )),
              ],
            ),
            drawer: ListDrawer(),
            body: SingleChildScrollView(
              physics:  const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const CustomRowSlider(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: (){
                            AppNavigator.customNavigator(context: context, screen: CategoriesScreen(), finish: false);
                          },
                          child: Text('Categories',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),)
                      ),
                    ),

                    const GetAllCategoriesList(),

                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: (){},
                          child: Text('Best Seller',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400))),
                    ),
                    const ListOfBestSeller(),



                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: (){},
                          child: Text('All Item',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400))),
                    ),
                    const AllItemGridView()

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
