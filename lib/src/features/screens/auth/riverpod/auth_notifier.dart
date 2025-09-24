import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/usecases/auth_use_cases.dart';

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthUseCase useCase;
  final Ref ref;

  AuthNotifier(this.useCase, this.ref) : super(const AsyncValue.data(false));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final success = await useCase.loginCall(email, password);
      state = AsyncValue.data(success);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> register(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final success = await useCase.registerCall(name, email, password);
      state = AsyncValue.data(success);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
