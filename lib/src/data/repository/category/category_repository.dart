import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/data/model/categories/category_model.dart';
import 'package:naheelsoufan_game/src/data/repository/game/start_game/start_game_provider.dart';
import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{

  CategoryModel? _categoryModel;
  CategoryModel? get categoryModel => _categoryModel;

  @override
  Future<bool> fetchCategoryData() async {
    try {
      ApiServices apiServices = ApiServices();

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.categoryUrl,
      );

      if (response['success'] == true && response != null) {
        _categoryModel = CategoryModel.fromJson(response);
        return true;
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return false;
    }
    return false;
  }
}
