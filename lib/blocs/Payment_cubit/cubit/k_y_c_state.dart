part of 'k_y_c_cubit.dart';

@immutable
abstract class KYCState {}

class KYCInitial extends KYCState {}

class KYCLoadingState extends KYCState {}

class KYCSucssesState extends KYCState {}

class KYCErrorState extends KYCState {}
