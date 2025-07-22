import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedProfileNotifier extends StateNotifier<int?> {
  SelectedProfileNotifier() : super(null);

  void selectProfile(int index) {
    state = index;
  }

  void resetSelection() {
    state = null;
  }
}

final selectedProfileProvider =
    StateNotifierProvider<SelectedProfileNotifier, int?>((ref) {
      return SelectedProfileNotifier();
    });
