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
}
