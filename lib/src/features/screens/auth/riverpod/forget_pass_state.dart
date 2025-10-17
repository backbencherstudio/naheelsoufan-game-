class ForgetPassState {
  final bool isLoading;
  final String? message;
  final bool isSuccess;

  const ForgetPassState({
    this.isLoading = false,
    this.message,
    this.isSuccess = false,
  });

  ForgetPassState copyWith({
    bool? isLoading,
    String? message,
    bool? isSuccess,
  }) {
    return ForgetPassState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}