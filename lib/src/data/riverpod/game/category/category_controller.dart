import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/categories/category_model.dart';
import 'package:naheelsoufan_game/src/domain/usecases/category_use_cases.dart';

final categoryProvider = StateNotifierProvider<CategoryController, CategoryModel?>((ref) => CategoryController());

class CategoryController extends StateNotifier<CategoryModel?>{

  CategoryController() : super(null);

  CategoryUseCases categoryUseCases = CategoryUseCases();

  Future<CategoryModel?> fetchCategoryDetails() async {
    final categoryDetails = await categoryUseCases.getCategoryDetailsCall();
    state = categoryUseCases.currentCategory;
    return state;
  }

}