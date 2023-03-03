part of 'company_profile_cubit.dart';

@immutable
abstract class CompanyProfileState {}

class CompanyProfileInitial extends CompanyProfileState {}

class CompanyProfileLoadingState extends CompanyProfileState {}

class CompanyProfileErrorState extends CompanyProfileState {}

class CompanyProfileSuccsessState extends CompanyProfileState {}
