class ChangePasswordState {
  final bool isLoading;
  final String? message;
  final bool isSuccess;

  const ChangePasswordState({
    this.isLoading = false,
    this.message,
    this.isSuccess = false,
  });

  ChangePasswordState copyWith({
    bool? isLoading,
    String? message,
    bool? isSuccess,
  }) {
    return ChangePasswordState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}