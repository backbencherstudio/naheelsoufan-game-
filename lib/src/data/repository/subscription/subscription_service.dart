import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/data/model/subcription/payment_intent_model.dart';
import 'package:naheelsoufan_game/src/data/model/subcription/subscription_intent_model.dart';
import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';
import '../../../core/services/token_services.dart';
import '../../model/subcription/subcription_model.dart';
import '../../model/subcription/user_subscription_model.dart';

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

  Future<PaymentIntentResponse?> fetchPaymentIntentData(String subscriptionId) async {
    try {
      final token = await _tokenService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final body = {
        "subscription_type_id": "cmg218zgs003wws38wz8vv978"
      };

      debugPrint(subscriptionId);

      final response = await _apiServices.postData(
          endPoint: ApiEndPoints.paymentIntentUrl,
          headers: headers,
          body: body
      );

      if (response['success'] == true) {
        debugPrint('payment Intent Created Successfully');
        return PaymentIntentResponse.fromJson(response);
      }
    } catch (e) {
      debugPrint('Error Creating Payment Intent: $e');
      return null;
    }
    return null;
  }

  Future<SubscriptionIntentModel?> fetchSubscriptionLastIntentStatus() async {
    try {
      final token = await _tokenService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await _apiServices.getData(
          endPoint: ApiEndPoints.lastPaymentIntentUrl,
          headers: headers,
      );

      if (response['success'] == true) {
        return SubscriptionIntentModel.fromJson(response["data"][0]);
      }
    } catch (e) {
      debugPrint('Error Creating Payment Intent: $e');
      return null;
    }
    return null;
  }

  Future<UserSubscriptionModel?> fetchUserSubscription() async {
    try {
      final token = await _tokenService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await _apiServices.getData(
        endPoint: ApiEndPoints.userSubscriptionUrl,
        headers: headers,
      );

      if (response['success'] == true) {
        return UserSubscriptionModel.fromJson(response);
      }
    } catch (e) {
      debugPrint('Error Creating Payment Intent: $e');
      return null;
    }
    return null;
  }
}