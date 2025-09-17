import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import '../../../data/model/auth/user_model.dart';
import '../../services/api_end_points.dart';
import '../../services/shared_prefernce_services.dart';
import 'auth_repository.dart';

class AuthRepositoryImplementation extends AuthRepository{

  // Register Service
  @override
  Future<bool> registerService(String name, String email, String password) async {
    try{
      ApiServices apiServices = ApiServices();
      final response = await apiServices.postData(
          body: {
            "name": name,
            "email": email,
            "password": password
          }, endPoint: ApiEndPoints.registerUrl
      );
      if(response['success'] == true) return true;
    }catch(e){
      return false;
    }
    return false;
  }

  // Login
  @override
  Future<bool> loginService(String email, String password) async {
    try{
      ApiServices apiServices = ApiServices();
      final response = await apiServices.postData(
          body: {
            "email": email,
            "password": password
          }, endPoint: ApiEndPoints.loginUrl
      );

      if(response['success'] == true) {
        await SharedPreference().setToken(response['authorization']['token']);
        debugPrint("\n\n\nToken: ${await SharedPreference().getToken()}\n\n\n");
        return true;
      }
    }catch(e){
      return false;
    }
    return false;
  }


  // Create Game
  @override
  Future<bool> createService(String email, String password) async {
    try{
      ApiServices apiServices = ApiServices();
      final response = await apiServices.postData(
          body: {
            "email": email,
            "password": password
          }, endPoint: ApiEndPoints.loginUrl
      );

      if(response['success'] == true) {
        await SharedPreference().setToken(response['authorization']['token']);
        debugPrint("\n\n\nToken: ${await SharedPreference().getToken()}\n\n\n");
        return true;
      }
    }catch(e){
      return false;
    }
    return false;
  }


  //Fetch User Data
  Future<dynamic> fetchUserData() async {
    try {
      ApiServices apiServices = ApiServices();
      final token = await SharedPreference().getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return null;
      }

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.fetchUserDataUrl,
        headers: headers,
      );

      debugPrint('User data fetched: $response');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return null;
    }
  }

}