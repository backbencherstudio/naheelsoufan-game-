class SelectionState {


  final Map<int, bool> selectedTiles; 
  SelectionState({this.selectedTiles = const {}});

  SelectionState copyWith({Map<int, bool>? selectedTiles}) {
    return SelectionState(
      selectedTiles: selectedTiles ?? this.selectedTiles,
    );
  }

}
