class GameDifficultyModel {
  String? id;
  String? name;
  int? points;
  String? createdAt;
  String? updatedAt;
  Language? language;

  GameDifficultyModel(
      {this.id,
        this.name,
        this.points,
        this.createdAt,
        this.updatedAt,
        this.language});

  GameDifficultyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    points = json['points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['points'] = this.points;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }
}

class Language {
  String? id;
  String? name;

  Language({this.id, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
