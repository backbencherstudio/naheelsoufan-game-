class SubscriptionModel {
  final bool success;
  final String message;
  final List<SubscriptionType> data;

  SubscriptionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubscriptionType.fromJson(e))
          .toList() ??
          [],
    );
  }
}

/// Subscription type model
class SubscriptionType {
  final String id;
  final String type;
  final int games;
  final int questions;
  final int players;
  final double price;
  final String status;
  final String languageId;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubscriptionType({
    required this.id,
    required this.type,
    required this.games,
    required this.questions,
    required this.players,
    required this.price,
    required this.status,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubscriptionType.fromJson(Map<String, dynamic> json) {
    return SubscriptionType(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      games: json['games'] ?? 0,
      questions: json['questions'] ?? 0,
      players: json['players'] ?? 0,
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0),
      status: json['status'] ?? '',
      languageId: json['language_id'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }
}