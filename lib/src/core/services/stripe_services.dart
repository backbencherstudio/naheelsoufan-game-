import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {

  static const String publishableKey = "pk_test_51RgIDjGbZdiSzPj89wef1vxHaK0jRa4fAUcYFU1KT1mhNBvhgmfwmUWLwaLuV8YEqpae9XdgIwi3cAwHaQ0bxniz00QSaaPJgY";

  static Future<void> makePayment(String clientSecretKey, String merchantName) async {
    try{
      debugPrint("\npayment 1\n");
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecretKey,
        merchantDisplayName: merchantName,
      )
    );
      debugPrint("\npayment 2\n");
    await presentPaymentSheet();
      debugPrint("\npayment 3\n");
  } catch(e) {
    debugPrint("Error In make payment: $e");
  }
}

  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      debugPrint("Error in presenting payment sheet: $e");
    }
  }
}