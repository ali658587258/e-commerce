import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/responds/products/products_model.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());
  static AddToCartCubit get(context) => BlocProvider.of(context);
  int totalPrice = 0;
  List<Product>? pList = [Product()];
  addToCart({required Product product}) {
    emit(AddToCartLoadingState());
    try {
      pList?.add(product);
      totalPrice = 0;
      for (int i = 1; i < pList!.length; i++) {
        totalPrice += pList![i].price!;
      }
      print("${pList?.length}");

      emit(AddToCartSucssesState());
    } catch (error) {
      debugPrint("Error $error");
      emit(AddToCartErrorState());
    }
    ;
    // ignore: unused_element
  }

  removeFromCart(int index) {
    emit(RemoveFromLoadingState());
    try {
      pList?.removeAt(index);
      print(index);
      totalPrice = 0;
      for (int i = 1; i < pList!.length; i++) {
        totalPrice += pList![i].price!;
      }
      emit(RemoveFromSucssesState());
    } catch (erroor) {
      emit(RemoveFromCartErrorState());
    }
    ;
  }
}
