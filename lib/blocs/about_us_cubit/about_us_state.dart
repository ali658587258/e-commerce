part of 'about_us_cubit.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsSuccessState extends AboutUsState {}
class AboutUsLoadingState extends AboutUsState {}
class AboutUsErrorState extends AboutUsState {}

