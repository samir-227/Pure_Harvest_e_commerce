import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruits_hub/core/utlis/api/api_keys.dart';

abstract class PaymentService {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
     log(error.toString());
    }
  }


  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "samir",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      'amount': amount,
      'currency': currency,
    };
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: data
    );
    return response.data["client_secret"];
  }
}
