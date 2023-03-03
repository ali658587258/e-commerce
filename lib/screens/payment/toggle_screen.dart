import 'dart:math';
import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/payment/ref_screen.dart';
import 'package:commerce/screens/payment/visa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/Payment_cubit/cubit/payment_cubit.dart';
import '../../../core/toast/toast_config.dart';
import '../../../enums/toast_state.dart';


class ToggleScreen extends StatelessWidget {
  String firstName, lastName, email, phone, address;
  ToggleScreen(
      {Key? key,
      required this.email,
      required this.address,
      required this.firstName,
      required this.lastName,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()
        ..getOrderRegistrationID(
            address: address,
            price: "",
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone)
        ..getPaymentRequest(
            'priceOrder', firstName, lastName, email, phone, address),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentRefCodeSuccessStates) {
              ToastConfig.showToast(
                  msg: 'Sucsses get ref code ',
                  toastStates: ToastStates.Success);
              AppNavigator.customNavigator(
                  context: context,
                  screen: ReferenceScreen(),
                  finish: false);
            }
            if (state is PaymentRefCodeErrorStates) {
              ToastConfig.showToast(
                  msg: 'Error', toastStates: ToastStates.Error);
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.black87, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/4090/4090458.png'),
                              SizedBox(height: 15.h),
                              Text(
                                'Payment with Ref code',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: VisaScreen(),
                              finish: false);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/349/349221.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
