import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/difficulties/difficulties_model_class.dart';
import '../../repository/difficulties/difficulty_service.dart';

final difficultiesStateNotifierProvider = StateNotifierProvider<DifficultiesNotifier, DifficultiesModelClass?>((ref) {
  return DifficultiesNotifier(ref);
});

class DifficultiesNotifier extends StateNotifier<DifficultiesModelClass?> {
  final Ref ref;
  DifficultiesNotifier(this.ref) : super(null);

  Future<void> fetchDifficulties() async {
    final difficultyService = DifficultyService();
    final difficulties = await difficultyService.fetchDifficultyData();
    state = difficulties;
  }
}

