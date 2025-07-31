class SideBarState {
  String selectedLanguages;
  bool isVisible;
  bool isVisibleVolume;

  SideBarState({
    this.selectedLanguages = "",
    this.isVisible = false,
    this.isVisibleVolume = false,
  });

  SideBarState copyWith({
    String? selectedLanguages,
    bool? isVisible,
    bool? isVisibleVolume,
  }) {
    return SideBarState(
      selectedLanguages: selectedLanguages ?? this.selectedLanguages,
      isVisible: isVisible ?? this.isVisible,
      isVisibleVolume: isVisibleVolume ?? this.isVisibleVolume,
    );
  }
}
