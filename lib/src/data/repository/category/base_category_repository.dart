import '../../model/categories/category_model.dart';

abstract class BaseCategoryRepository{
  Future<bool> fetchCategoryData();

  CategoryModel? get categoryModel;
}