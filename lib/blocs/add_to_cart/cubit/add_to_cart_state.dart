part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartErrorState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSucssesState extends AddToCartState {}

class RemoveFromCartErrorState extends AddToCartState {}

class RemoveFromLoadingState extends AddToCartState {}

class RemoveFromSucssesState extends AddToCartState {}
