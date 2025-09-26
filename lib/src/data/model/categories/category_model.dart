import '../pagination.dart';

class CategoryModel {
  final bool success;
  final String message;
  final List<Category> data;
  final Pagination pagination;

  CategoryModel({
    required this.success,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Category {
  final String id;
  final String name;
  final String? image;
  final Language language;

  Category({
    required this.id,
    required this.name,
    this.image,
    required this.language,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
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