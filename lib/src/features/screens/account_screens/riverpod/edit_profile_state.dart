class EditProfileState {
  final bool isLoading;
  final String? message;

  const EditProfileState({
    this.isLoading = false,
    this.message,
  });

  EditProfileState copyWith({
    bool? isLoading,
    String? message,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}
