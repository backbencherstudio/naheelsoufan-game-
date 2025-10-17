class ResetPassState {
  final bool isLoading;
  final String? message;
  final bool isSuccess;

  const ResetPassState({
    this.isLoading = false,
    this.message,
    this.isSuccess = false,
  });

  ResetPassState copyWith({
    bool? isLoading,
    String? message,
    bool? isSuccess,
  }) {
    return ResetPassState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
