import '../../data/model/auth/user_model.dart';
import '../../data/repository/auth/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<bool> registerCall(String name, String email, String password) {
    return authRepository.registerService(name, email, password);
  }

  Future<bool> loginCall(String email, String password) {
    return authRepository.loginService(email, password);
  }

  Future<bool> getUserDetailsCall() async {
    final success = await authRepository.fetchUserData();
    return success;
  }

  UserModel? get currentUser => authRepository.userModel;
}
