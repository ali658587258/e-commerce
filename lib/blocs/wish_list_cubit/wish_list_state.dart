part of 'wish_list_cubit.dart';

@immutable
abstract class WishListState {}

class WishListInitial extends WishListState {}

class WishListLoadingState extends WishListState {}
class WishListSuccessState extends WishListState {}
class WishListErrorState extends WishListState {}


class AddTOWishListLoadingState extends WishListState {}
class AddTOWishListSuccessState extends WishListState {}
class AddTOWishListErrorState extends WishListState {}

class RemoveFromWishListLoadingState extends WishListState {}
class RemoveFromWishListSuccessState extends WishListState {}
class RemoveFromWishListErrorState extends WishListState {}