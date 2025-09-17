class GameCategoryModel {
  String? id;
  String? name;
  String? image;
  int? totalQuestions;

  GameCategoryModel({this.id, this.name, this.image, this.totalQuestions});

  GameCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    totalQuestions = json['total_questions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['total_questions'] = totalQuestions;
    return data;
  }
}