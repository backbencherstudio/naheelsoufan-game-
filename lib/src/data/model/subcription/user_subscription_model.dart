class UserSubscriptionModel {
  final bool success;
  final String message;
  final SubscriptionData data;

  UserSubscriptionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return UserSubscriptionModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: SubscriptionData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class SubscriptionData {
  final String subscriptionId;
  final String status;
  final bool isActive;
  final bool canPlayGames;
  final int gamesRemaining;
  final SubscriptionType subscriptionType;

  SubscriptionData({
    required this.subscriptionId,
    required this.status,
    required this.isActive,
    required this.canPlayGames,
    required this.gamesRemaining,
    required this.subscriptionType,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      subscriptionId: json['subscription_id'] as String,
      status: json['status'] as String,
      isActive: json['is_active'] as bool,
      canPlayGames: json['can_play_games'] as bool,
      gamesRemaining: json['games_remaining'] as int,
      subscriptionType: SubscriptionType.fromJson(json['subscription_type']),
    );
  }
}

class SubscriptionType {
  final String type;
  final int games;
  final int questions;
  final int players;

  SubscriptionType({
    required this.type,
    required this.games,
    required this.questions,
    required this.players,
  });

  factory SubscriptionType.fromJson(Map<String, dynamic> json) {
    return SubscriptionType(
      type: json['type'] as String,
      games: json['games'] as int,
      questions: json['questions'] as int,
      players: json['players'] as int,
    );
  }
}