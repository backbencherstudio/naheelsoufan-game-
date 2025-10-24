import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCatIndex = StateProvider<List<int>>((ref)=>[]);

final isCategorySelectedClicked = StateProvider.family<bool, int>((ref, questionID)=>false);

final isSomethingClicked = StateProvider<bool>((ref)=>false);

/// CategoryListNotifier

class CategoryMapNotifier extends StateNotifier<Map<String?, String?>> {
  CategoryMapNotifier() : super({});

  // Add a category to the map
  void addCategory(String? id, String? name) {
    final newMap = Map.of(state);
    newMap[id] = name;
    state = newMap; // triggers UI update
  }

  // Remove a category from the map
  void removeCategory(String? id) {
    final newMap = Map.of(state);
    newMap.remove(id);
    state = newMap; // triggers UI update
  }
}

final categoryListProvider = StateNotifierProvider<CategoryMapNotifier, Map<String?, String?>>(
      (ref) => CategoryMapNotifier(),
);