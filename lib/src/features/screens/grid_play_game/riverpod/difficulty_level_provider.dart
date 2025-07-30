import 'package:flutter_riverpod/flutter_riverpod.dart';

class DifficultyLevelProvider extends StateNotifier<Map<int, bool>> {
  DifficultyLevelProvider() : super({});

  void toggle(int id) {
    state = {
      for (final key in state.keys) key: false, // reset all to false
      id: true, // set only one to true
    };
  }

  bool isSelected(int id) => state[id] ?? false;
}
