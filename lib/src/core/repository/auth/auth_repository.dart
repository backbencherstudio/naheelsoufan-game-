abstract class AuthRepository{
  Future<bool> registerService(String name, String email, String password);
  Future<bool> loginService(String email, String password);
  Future<dynamic> fetchUserData();
}