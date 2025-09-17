import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/repository/subscription/subscription_repository.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import '../../../data/model/subcription/subcription_model.dart';
import '../../services/api_end_points.dart';
import '../../services/shared_prefernce_services.dart';

class SubscriptionRepositoryImplementation extends SubscriptionRepository{

  //Fetch User Data
  Future<dynamic> fetchSubscriptionData() async {
    try {
      ApiServices apiServices = ApiServices();
      final token = await SharedPreference().getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return null;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await apiServices.getData(
        endPoint: ApiEndPoints.subscriptionUrl,
        headers: headers
      );

      debugPrint('User data fetched: $response');
      return SubscriptionModel.fromJson(response['data']);
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return null;
    }
  }

}