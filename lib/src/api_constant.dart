class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey =
  'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SndjbTltYVd4bFgzQnJJam8zTURnM05qTXNJbTVoYldVaU9pSnBibWwwYVdGc0lpd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuMU42LUEtcXpzRmtsYTFjX1RqeVF0RDhUb1doVVFJTjljcGRPQjQ5LV9vUzZLcHNod3BOUXdpeGhvbGp0c0dReWpvYklJOExnVWFyc3VYTkItXzg0cGc=';

  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';

  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframe/736964?token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '3491573';
  static const String integrationIdKiosk = 'ENTER_YOUR_INTEGRATION_ID';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
