import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/responds/payment/order_register_model.dart';
import '../../../models/responds/payment/payment_request_model.dart';
import '../../../service/payment_helper.dart';
import '../../../src/api_constant.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  Future getOrderRegistrationID(
      {required String price,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String address}) async {
    emit(PaymentOrderIdLoadingStates());
    print(ApiContest.paymentFirstToken);
    Paymenthelper.postData(url: ApiContest.getOrderId, data: {
      "auth_token": ApiContest.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": "1",
      "currency": "EGP",
      "items": [
        {
          "name": "ASC1515",
          "amount_cents": "500000",
          "description": "Smart Watch",
          "quantity": "1"
        },
        {
          "name": "ERT6565",
          "amount_cents": "200000",
          "description": "Power Bank",
          "quantity": "1"
        }
      ],
      "shipping_data": {
        "apartment": "803",
        "email": email,
        "floor": "42",
        "first_name": firstName,
        "street": address,
        "building": "8028",
        "phone_number": phone,
        "postal_code": "01898",
        "extra_description": "8 Ram , 128 Giga",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": lastName,
        "state": "Utah"
      },
      "shipping_details": {
        "notes": " test",
        "number_of_packages": 1,
        "weight": 1,
        "weight_unit": "Kilogram",
        "length": 1,
        "width": 1,
        "height": 1,
        "contents": "product of some sorts"
      }
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
          OrderRegistrationModel.fromJson(value.data);
      ApiContest.paymentOrderId = orderRegistrationModel.id.toString();
      getPaymentRequest(price, firstName, lastName, email, phone, address);
      print('The order id 🍅 =${ApiContest.paymentOrderId}');
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      print('Error $error');
      print('Error in order id 🤦‍♂️');
      emit(
        PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  Future<void> getPaymentRequest(String priceOrder, String firstName,
      String lastName, String email, String phone, String address) async {
    emit(PaymentRequestTokenLoadingStates());
    Paymenthelper.postData(
      url: ApiContest.getPaymentRequest,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "amount_cents": "100",
        "expiration": 3600,
        "order_id": ApiContest.paymentOrderId,
        "billing_data": {
          "apartment": "803",
          "email": email,
          "floor": "42",
          "first_name": firstName,
          "street": "Ethan Land",
          "building": "8028",
          "phone_number": phone,
          "shipping_method": "PKG",
          "postal_code": "01898",
          "city": "Jaskolskiburgh",
          "country": "CR",
          "last_name": lastName,
          "state": "Utah"
        },
        "currency": "EGP",
        "integration_id": ApiContest.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
          PaymentRequestModel.fromJson(value.data);
      ApiContest.finalToken = paymentRequestModel.token;
      print('Final token 🚀 ${ApiContest.finalToken}');
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      print(error);
      print('Error in final token 🤦‍♂️');
      print('Final token 🚀 ${ApiContest.finalToken}');
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }

  Future getRefCode() async {
    Paymenthelper.postData(
      url: ApiContest.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": ApiContest.finalToken,
      },
    ).then((value) {
      ApiContest.refCode = value.data['id'].toString();
      print('The ref code 🍅${ApiContest.refCode}');
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      print("Error in ref code 🤦‍♂️");
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
}
