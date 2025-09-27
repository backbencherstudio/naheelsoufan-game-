import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/categories/category_model.dart';
import 'package:naheelsoufan_game/src/domain/usecases/category_use_cases.dart';

final categoryProvider = StateNotifierProvider<CategoryNotifier, CategoryModel?>((ref) => CategoryController());

class CategoryController extends StateNotifier<CategoryModel?>{

  CategoryController() : super(null);

  Future<void> fetchCategoryDetails() async {


    // state = const AsyncValue.loading();
    // try {
    //   final success = await useCase.getCategoryDetailsCall();
    //   if (success) {
    //     final user = useCase.C.categoryModel;
    //     if (user != null) {
    //       ref.read(categoryProvider.notifier).state;
    //     }
    //   }
    //   state = AsyncValue.data(success);
    // } catch (e, st) {
    //   state = AsyncValue.error(e, st);
    // }
  }
}