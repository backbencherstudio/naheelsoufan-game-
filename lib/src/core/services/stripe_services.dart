import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {

  static const String publishableKey = "pk_test_51SB7d0AwY7ujXaVJxSrzMEWLsZoeI5yeHTTuiwzEIsc2bHLXrwtrh4JQJIF7xAuPb9XiMzTWtTzD6KPN8ppUniux00JniCa3nK";

  static Future<void> makePayment(String clientSecretKey, String merchantName) async {
    try{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecretKey,
        merchantDisplayName: merchantName,
      )
    );
    presentPaymentSheet();
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