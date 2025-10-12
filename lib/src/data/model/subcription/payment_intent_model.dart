class PaymentIntentResponse {
  final bool success;
  final String message;
  final PaymentData data;

  PaymentIntentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentIntentResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: PaymentData.fromJson(json['data'] ?? {}),
    );
  }
}

class PaymentData {
  final String clientSecret;
  final String subscriptionId;
  final String paymentIntentId;
  final num amount;
  final String currency;
  final String status;

  PaymentData({
    required this.clientSecret,
    required this.subscriptionId,
    required this.paymentIntentId,
    required this.amount,
    required this.currency,
    required this.status,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      clientSecret: json['client_secret'] ?? '',
      subscriptionId: json['subscription_id'] ?? '',
      paymentIntentId: json['payment_intent_id'] ?? '',
      amount: json['amount'] ?? 0,
      currency: json['currency'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
