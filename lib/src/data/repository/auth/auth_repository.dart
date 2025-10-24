import '../../../data/model/auth/user_model.dart';

abstract class AuthRepository {
  Future<bool> registerService(String name, String email, String password);
  Future<bool> loginService(String email, String password);
  Future<bool> fetchUserData();

  UserModel? get userModel;
  String get loginMessage;
  String get registerMessage;
}
