import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/auth_use_cases.dart';
import '../../../features/screens/auth/riverpod/auth_state.dart';
import '../user/user_controller.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final AuthUseCase useCase;
  final Ref ref;

  AuthNotifier(this.useCase, this.ref) : super(AsyncValue.data(AuthState()));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final success = await useCase.loginCall(email, password);
      final loginMessage = useCase.loginMessage;

      // Update state with the success status and message
      state = AsyncValue.data(AuthState(success: success, message: loginMessage));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> register(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final success = await useCase.registerCall(name, email, password);
      final registerMessage = useCase.registerMessage;
      state = AsyncValue.data(AuthState(success: success, message: registerMessage));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> fetchUserDetails() async {
    state = const AsyncValue.loading();
    try {
      final success = await useCase.getUserDetailsCall();
      if (success) {
        final user = useCase.authRepository.userModel;
        if (user != null) {
          ref.read(userProvider.notifier).insertData(user);
        }
      }
      state = AsyncValue.data(AuthState(success: success, message: success ? "User data fetched successfully" : "Failed to fetch user data"));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

