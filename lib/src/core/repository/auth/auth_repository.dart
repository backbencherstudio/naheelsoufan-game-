import '../../../data/model/auth/user_model.dart';

abstract class AuthRepository{
  //AUTH
  Future<bool> registerService(String name, String email, String password);
  Future<bool> loginService(String email, String password);
  //Future<UserModel?> fetchUserData();
}