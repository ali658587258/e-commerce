part of 'login_out_cubit.dart';

@immutable
abstract class LoginOutState {}

class LoginOutInitial extends LoginOutState {}

class LoginOutLoadingState extends LoginOutState {}
class LoginOutSuccessState extends LoginOutState {}
class LoginOutErrorState extends LoginOutState {}

