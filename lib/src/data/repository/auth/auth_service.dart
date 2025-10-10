import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';
import '../../../data/model/auth/user_model.dart';
import '../../../core/constant/api_end_points.dart';
import 'auth_repository.dart';

class AuthService extends AuthRepository {
  final TokenService _tokenService = TokenService();

  @override
  Future<bool> registerService(String name, String email, String password) async {
    try {
      ApiServices apiServices = ApiServices();
      final response = await apiServices.postData(
        body: {
          "name": name,
          "email": email,
          "password": password,
          "type": "host"
        },
        endPoint: ApiEndPoints.registerUrl,
      );

      return response['response']['success'] == true;
    } catch (e) {
      debugPrint('Register Error: $e');
      return false;
    }
  }

  @override
  Future<bool> loginService(String email, String password) async {
    try {
      ApiServices apiServices = ApiServices();
      final response = await apiServices.postData(
        body: {
          "email": email,
          "password": password,
        },
        endPoint: ApiEndPoints.loginUrl,
      );

      if (response['success'] == true) {
        await _tokenService.setToken(response['authorization']['token']);

        final token = await _tokenService.getToken();
        if (token == null || token.isEmpty) {
          debugPrint('Token not found, please login');
          return false;
        }
        print('\n\n token is $token\n\n');
        return true;
      }
    } catch (e) {
      debugPrint('Login Error: $e');
      return false;
    }
    return false;
  }

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  @override
  Future<bool> fetchUserData() async {
    try {
      ApiServices apiServices = ApiServices();
      final token = await _tokenService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return false;
      }

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.fetchUserDataUrl,
        headers: headers,
      );

      if (response['success'] == true && response['data'] != null) {
        _userModel = UserModel.fromJson(response['data']);
        return true;
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return false;
    }
    return false;
  }
}
