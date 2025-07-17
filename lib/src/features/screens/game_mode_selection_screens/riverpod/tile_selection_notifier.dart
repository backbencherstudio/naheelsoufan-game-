class TileSelectionState {
  final Map<int, bool> selectedIndices;

  TileSelectionState({this.selectedIndices = const {}});
  TileSelectionState copyWith({Map<int, bool>? selectedIndices}) {
    return TileSelectionState(
      selectedIndices: selectedIndices ?? this.selectedIndices,
    );



  }


  
}
