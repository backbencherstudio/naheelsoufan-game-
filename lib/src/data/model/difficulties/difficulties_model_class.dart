
import '../pagination.dart';

class DifficultiesModelClass {
  final bool success;
  final String message;
  final List<Difficulty> data;
  final Pagination pagination;

  DifficultiesModelClass({
    required this.success,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory DifficultiesModelClass.fromJson(Map<String, dynamic> json) {
    return DifficultiesModelClass(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => Difficulty.fromJson(e))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Difficulty {
  final String id;
  final String name;
  final int points;
  final Language language;

  Difficulty({
    required this.id,
    required this.name,
    required this.points,
    required this.language,
  });

  factory Difficulty.fromJson(Map<String, dynamic> json) {
    return Difficulty(
      id: json['id'],
      name: json['name'],
      points: json['points'],
      language: Language.fromJson(json['language']),
    );
  }
}

class Language {
  final String id;
  final String name;

  Language({
    required this.id,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      name: json['name'],
    );
  }
}