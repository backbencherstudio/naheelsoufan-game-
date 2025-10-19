import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_state.dart';
// multiselection provider
final selectionProvider =
StateNotifierProvider<SelectionNotifier, SelectionState>((ref) {
  return SelectionNotifier();
});

class SelectionNotifier extends StateNotifier<SelectionState> {
  SelectionNotifier() : super(SelectionState());

  void toggleTileSelection(int index) {
    final selectedTiles = Map<int, bool>.from(state.selectedTiles);
    selectedTiles[index] = !(selectedTiles[index] ?? false);
    state = state.copyWith(selectedTiles: selectedTiles);
  }
  bool areAllTilesSelected(int totalTiles) {
    return state.selectedTiles.length == totalTiles &&
        !state.selectedTiles.values.contains(false);
  }
}


//single selection provider

final selectProvider = StateProvider.autoDispose<int?>(
        (ref)=> null
);