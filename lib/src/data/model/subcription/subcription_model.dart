class SubscriptionModel {
  String? id;
  String? type;
  int? games;
  int? questions;
  int? players;
  double? price;
  String? status;
  String? languageId;
  String? createdAt;
  String? updatedAt;

  SubscriptionModel(
      {this.id,
        this.type,
        this.games,
        this.questions,
        this.players,
        this.price,
        this.status,
        this.languageId,
        this.createdAt,
        this.updatedAt});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    games = json['games'];
    questions = json['questions'];
    players = json['players'];
    price = (json['price'] != null)
        ? (json['price'] is int
        ? (json['price'] as int).toDouble()
        : (json['price'] as double))
        : null;
    status = json['status'];
    languageId = json['language_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['games'] = this.games;
    data['questions'] = this.questions;
    data['players'] = this.players;
    data['price'] = this.price;
    data['status'] = this.status;
    data['language_id'] = this.languageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
