part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class GetAllProductsSuccessState extends ProductsState {}
class GetAllProductsLoadingState extends ProductsState {}
class GetAllProductsErrorState extends ProductsState {}


class GetAllCategoriesErrorState extends ProductsState {}
class GetAllCategoriesSuccessState extends ProductsState {}
class GetAllCategoriesLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {}
class ProductsLoadingState extends ProductsState {}
class ProductsErrorState extends ProductsState {}

