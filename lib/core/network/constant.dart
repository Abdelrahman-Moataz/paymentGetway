

class APIContest {
  //https://accept.paymob.com/api/auth/tokens
  //https://accept.paymob.com/api/ecommerce/orders

  static const String baseUrl = "https://accept.paymob.com/api";
  static const String getAuthToken = '/auth/tokens';
  static const String paymentAPIKey = 'Enter your API key';
  static const String getOrderId = '/ecommerce/orders';
  static const String getPaymentId = '/acceptance/payment_keys';
  static const String getRefCode  = '/acceptance/payments/pay';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';
  static String refCode = '';
  static String visaUrl = '$baseUrl/acceptance/iframes/804583?payment_token=$finalToken';
  
  static String integrationIdKiosk = "enter ur IdKiosk";
  static String integrationIdCart = 'enter ur IdCart';

}


class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
