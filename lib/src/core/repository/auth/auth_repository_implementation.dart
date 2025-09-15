import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import '../../services/api_end_points.dart';
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

  //login
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
      if(response['success'] == true) return true;
    }catch(e){
      return false;
    }
    return false;
  }
}