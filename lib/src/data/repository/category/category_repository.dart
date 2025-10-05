import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/data/model/categories/category_model.dart';
import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';
import '../../../core/services/token_services.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{

  CategoryModel? _categoryModel;
  @override
  CategoryModel? get categoryModel => _categoryModel;
  final TokenService _tokenService = TokenService();

  @override
  Future<bool> fetchCategoryData() async {
    try {
      ApiServices apiServices = ApiServices();
      final token = await _tokenService.getToken();
      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return false;
      }

      final headers = {'Authorization': 'Bearer $token'};

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.categoryUrl,
        headers: headers
      );

      if (response['success'] == true && response != null) {
        debugPrint('Category data fetched successfully');
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
