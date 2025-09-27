import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repository/auth/auth_repository.dart';
import '../../../../data/repository/auth/auth_service.dart';
import '../../../../domain/usecases/auth_use_cases.dart';
import '../../../../data/riverpod/auth/auth_notifier.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthService();
});

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthUseCase(authRepository);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool>>((ref) {
  final useCase = ref.watch(authUseCaseProvider);
  return AuthNotifier(useCase, ref);
});

// For password visibility
final isObscure1 = StateProvider<bool>((ref) => false);
final isObscure2 = StateProvider<bool>((ref) => false);
final isObscure3 = StateProvider<bool>((ref) => false);
