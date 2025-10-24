import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';
import '../../../data/model/auth/user_model.dart';
import '../../../core/constant/api_end_points.dart';
import 'auth_repository.dart';

class AuthService extends AuthRepository {
  final TokenService _tokenService = TokenService();

  String _registerMessage = '';
  String get registerMessage => _registerMessage;


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
      _registerMessage = response['response']['message'];
      return response['response']['success'] == true;
    } catch (e) {
      debugPrint('Register Error: $e');
      return false;
    }
  }

  String _loginMessage = '';
  String get loginMessage => _loginMessage;

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

      if (response != null) {
        int statusCode = response['status_code'] ?? 0;


        if (statusCode == 200) {
          if (response['success'] == true) {
            await _tokenService.setToken(response['authorization']['token']);
            final token = await _tokenService.getToken();

            if (token == null || token.isEmpty) {
              debugPrint('Token not found, please login');
              return false;
            }
            print('\n\n token is $token\n\n');
            _loginMessage = response['message'];
            return true;
          } else {
            _loginMessage = response['message'] ?? "Invalid credentials";
            return false;
          }
        } else if (statusCode == 400) {
          _loginMessage = "Bad request. Please check the entered details.";
          return false;
        } else if (statusCode == 401) {
          _loginMessage = response['message'];
          return false;
        } else if (statusCode == 500) {
          _loginMessage = "Internal server error. Please try again later.";
          return false;
        } else {
          if (response['success'] == true) {
            await _tokenService.setToken(response['authorization']['token']);
            final token = await _tokenService.getToken();

            if (token == null || token.isEmpty) {
              debugPrint('Token not found, please login');
              return false;
            }
            print('\n\n token is $token\n\n');
            _loginMessage = response['message'];
            return true;
          } else {
            _loginMessage = response['message'] ?? "Invalid credentials";
            return false;
          }
          return false;
        }
      } else {
        _loginMessage = "No response from the server.";
        return false;
      }
    } catch (e) {
      debugPrint('Login Error: $e');
      if (e.toString().contains('Email not found')) {
        _loginMessage = "Email not found";
      } else if (e.toString().contains('Password not matched')) {
        _loginMessage = "Password not matched";
      } else {
        _loginMessage = "An error occurred while trying to login.";
      }
      return false;
    }
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
        'Content-Type': 'application/json'
      };

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.fetchUserDataUrl,
        headers: headers,
      );

      if (response['success'] == true && response['data'] != null) {
        debugPrint('---------- fetch user details -----------');
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
