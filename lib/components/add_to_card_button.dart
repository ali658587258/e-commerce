import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../core/toast/toast_config.dart';
import '../enums/toast_state.dart';
import '../models/products_model.dart';
import '../src/app_color.dart';
import 'custom_button.dart';


class AddToCardButton extends StatelessWidget {
  Product product;
  double width, hight, radiusCircular;
  AddToCardButton({
    required this.hight,
    required this.product,
    required this.radiusCircular,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = AddToCartCubit.get(context);
        return CustomButton(
          function: () async {
            if (product != null) {
              await cubit.addToCart(product: product);

              if (state is AddToCartSucssesState) {
                ToastConfig.showToast(msg: "Added", toastStates: ToastStates.Success);
              }

              if (state is AddToCartErrorState) {
                ToastConfig.showToast(msg: "Error", toastStates: ToastStates.Error);
              }

            }


          },
          colorContainer: AppColor.KMainColor,
          radiusCircular: radiusCircular,
          width: width,
          hight: hight,
          text: 'Add To Cart',
          textColor: AppColor.kWhiteColor,
        );
      },
    );
  }
}
