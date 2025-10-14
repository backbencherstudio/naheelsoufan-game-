import 'package:naheelsoufan_game/src/data/model/categories/category_model.dart';
import '../../data/repository/category/category_repository.dart';

class CategoryUseCases {
  CategoryRepository C = CategoryRepository();
  Future<bool> getCategoryDetailsCall(int pageNo) async {
    final success = await C.fetchCategoryData(pageNo);
    return success;
  }
  CategoryModel? get currentCategory => C.categoryModel;
}