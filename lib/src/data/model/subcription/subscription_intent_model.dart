class SubscriptionIntentModel {
  final String id;
  final String userId;
  final String subscriptionTypeId;
  final String status;
  final int gamesPlayedCount;
  final String paymentStatus;
  final String? paymentRawStatus;
  final String? paidCurrency;
  final String paymentProvider;
  final String paymentReferenceNumber;
  final String paymentProviderChargeType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SubscriptionTypeIntent subscriptionType;

  SubscriptionIntentModel({
    required this.id,
    required this.userId,
    required this.subscriptionTypeId,
    required this.status,
    required this.gamesPlayedCount,
    required this.paymentStatus,
    this.paymentRawStatus,
    this.paidCurrency,
    required this.paymentProvider,
    required this.paymentReferenceNumber,
    required this.paymentProviderChargeType,
    required this.createdAt,
    required this.updatedAt,
    required this.subscriptionType,
  });

  factory SubscriptionIntentModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionIntentModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      subscriptionTypeId: json['subscription_type_id'] as String,
      status: json['status'] as String,
      gamesPlayedCount: json['games_played_count'] as int,
      paymentStatus: json['payment_status'] as String,
      paymentRawStatus: json['payment_raw_status'] as String?,
      paidCurrency: json['paid_currency'] as String?,
      paymentProvider: json['payment_provider'] as String,
      paymentReferenceNumber: json['payment_reference_number'] as String,
      paymentProviderChargeType: json['payment_provider_charge_type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      subscriptionType: SubscriptionTypeIntent.fromJson(json['subscription_type']),
    );
  }
}

class SubscriptionTypeIntent {
  final String id;
  final String type;
  final int games;
  final int questions;
  final int players;
  final int price;
  final String status;
  final String languageId;

  SubscriptionTypeIntent({
    required this.id,
    required this.type,
    required this.games,
    required this.questions,
    required this.players,
    required this.price,
    required this.status,
    required this.languageId,
  });

  factory SubscriptionTypeIntent.fromJson(Map<String, dynamic> json) {
    return SubscriptionTypeIntent(
      id: json['id'] as String,
      type: json['type'] as String,
      games: json['games'] as int,
      questions: json['questions'] as int,
      players: json['players'] as int,
      price: json['price'] as int,
      status: json['status'] as String,
      languageId: json['language_id'] as String,
    );
  }
}
