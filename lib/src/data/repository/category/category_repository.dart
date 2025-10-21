import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/language_services.dart';
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
  final LanguageIdService _languageIdService = LanguageIdService();

  @override
  Future<bool> fetchCategoryData(int pageNo) async {
    try {
      ApiServices apiServices = ApiServices();
      final token = await _tokenService.getToken();
      final languageId = "cmfzc2whx001zwsxsndh2pxqu";

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return false;
      }

      final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};

      final response = await apiServices.getData(
        endPoint: "${ApiEndPoints.categoryUrl}?page=$pageNo&limit=9&language_id=$languageId",
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

  // Future<CategoryModel?> fetchCategoryPageData(int pageNo) async {
  //   try {
  //     ApiServices apiServices = ApiServices();
  //     final token = await _tokenService.getToken();
  //     if (token == null || token.isEmpty) {
  //       debugPrint('Token not found, please login');
  //       return null;
  //     }
  //
  //     final headers = {'Authorization': 'Bearer $token'};
  //
  //     final response = await apiServices.getData(
  //         endPoint: "${ApiEndPoints.categoryUrl}?page=$pageNo",
  //         headers: headers
  //     );
  //
  //     if (response['success'] == true && response != null) {
  //       debugPrint('Category data fetched successfully');
  //       return CategoryModel.fromJson(response);
  //     }
  //   } catch (e) {
  //     debugPrint('Error fetching user data: $e');
  //     return null;
  //   }
  //   return null;
  // }
}
