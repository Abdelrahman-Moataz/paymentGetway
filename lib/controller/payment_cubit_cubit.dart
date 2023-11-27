import 'package:paymentapp/core/constes/constes.dart';
import 'package:paymentapp/controller/payment_cubit_state.dart';
import 'package:paymentapp/core/network/constant.dart';
import 'package:paymentapp/core/network/dio_helpre.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());
  static PaymentCubitCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    //Loading state
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(
      url: APIContest.getAuthToken,
      data: {
        "api_key": APIContest.paymentAPIKey,
      },
    ).then((value) {
      APIContest.paymentFirstToken = value.data['token'];
      print("the token: ${APIContest.paymentFirstToken}");

      //Success stste

      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      emit(PaymentAuthErrorState());
    });
  }

  //get order id

  Future getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetOrderRegistrationIdLoadingState());
    DioHelper.postDataDio(
      url: APIContest.getOrderId,
      data: {
        'auth_token': APIContest.paymentFirstToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      },
    ).then((value) {
      APIContest.paymentOrderId = value.data['id'];
      getPaymentRequest(firstName: firstName, lastName: lastName, email: email, phone: phone, price: price);
      emit(PaymentGetOrderRegistrationIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetOrderRegistrationIdErrorState());
    });
  }

  Future<void> getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetPaymentRequestLoadingState());
    DioHelper.postDataDio(
      url: APIContest.getPaymentId,
      data: {
        'auth_token': APIContest.paymentFirstToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": APIContest.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "Utah"
        },
        "currency": "EGP",
        "integration_id": APIContest.integrationIdCart,
        "lock_order_when_paid": "false"
      },
    ).then(
      (value) {
        APIContest.finalToken = value.data['token'];
        emit(PaymentGetPaymentRequestSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(PaymentGetPaymentRequestErrorState());
      },
    );
  }

  Future<void> getRefCode() async {
    emit(PaymentRefCodeLoadingState());
    DioHelper.postDataDio(
      url: APIContest.getRefCode,
      data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": APIContest.finalToken
      },
    ).then(
      (value) {
        print('Success to get ref code');
        APIContest.refCode = value.data['id'].toString();
        emit(PaymentRefCodeSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(PaymentRefCodeErrorState());
      },
    );
  }
}
