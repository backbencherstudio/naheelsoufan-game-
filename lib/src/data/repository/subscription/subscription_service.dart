import 'package:flutter/cupertino.dart';
import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';
import '../../../core/services/token_services.dart';
import '../../model/subcription/subcription_model.dart';

class SubscriptionService {
  final ApiServices _apiServices = ApiServices();
  final TokenService _tokenService = TokenService();

  Future<SubscriptionModel?> fetchSubscriptionData() async {
    try {
      final token = await _tokenService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
      }

      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await _apiServices.getData(
        endPoint: ApiEndPoints.subscriptionUrl,
        headers: headers
      );

      if (response['success'] == true && response['data'] != null) {
        debugPrint('Subscriptions fetched successfully');
        debugPrint('Subscription data: ${response['message']}');
        return SubscriptionModel.fromJson(response);
      }
    } catch (e) {
      debugPrint('Error fetching Subscription data: $e');
      return null;
    }
    return null;
  }
}