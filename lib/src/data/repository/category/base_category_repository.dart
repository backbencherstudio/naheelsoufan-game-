import '../../model/categories/category_model.dart';

abstract class BaseCategoryRepository{
  Future<bool> fetchCategoryData(int pageNo);

  CategoryModel? get categoryModel;
}