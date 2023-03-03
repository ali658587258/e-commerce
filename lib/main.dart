import 'package:commerce/service/dio_helper/dio_helper.dart';
import 'package:commerce/service/payment_helper.dart';
import 'package:commerce/service/sp_helper/cache_helper.dart';
import 'package:commerce/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  DioHelper.init();
  await SharedPreferencesHelper.init();
  Paymenthelper.init();
  debugPrint(SharedPreferencesHelper.getData(key: 'isFirst'));

  runApp(AppRoot());
}
