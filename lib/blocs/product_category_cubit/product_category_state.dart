part of 'product_category_cubit.dart';

@immutable
abstract class ProductCategoryState {}

class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategorySuccessState extends ProductCategoryState {}
class ProductCategoryLoadingState extends ProductCategoryState {}
class ProductCategoryErrorState extends ProductCategoryState {}

