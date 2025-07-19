import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/tile_selection_notifier.dart';

final tileSelectionProvider =
    StateNotifierProvider<TileSelectionNotifier, TileSelectionState>((ref) {
      return TileSelectionNotifier();
    });

class TileSelectionNotifier extends StateNotifier<TileSelectionState> {
  TileSelectionNotifier() : super(TileSelectionState());

  void toggleTileSelection(int index) {
    final selectedIndex = Map<int, bool>.from(state.selectedIndices);
   selectedIndex[index] = !(selectedIndex[index]?? false);
   state = state.copyWith(selectedIndices: selectedIndex);
  }
}
