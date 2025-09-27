import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';
import 'package:naheelsoufan_game/src/core/services/language_services.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_services.dart';

class SelectGameModeService {
  final ApiServices _apiServices = ApiServices();
  final LanguageIdService _languageIdService = LanguageIdService();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();

  Future<bool> createGame({required context, required String gameMode}) async {
    final token = await _tokenService.getToken();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return false;
    }

    final languageId = await _languageIdService.getToken();

    final headers = {'Authorization': 'Bearer $token'};

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.createGameUrl,
        body: {"language_id": languageId ?? '', "mode": gameMode},
        headers: headers,
      );

      if (response['success'] == true) {
        print('Game mode select call successful: $response');
        return true;
      } else {
        print('API call failed: ${response.toString()}');
        return false;
      }
    } catch (e) {
      print('Error during API call: $e');
      return false;
    }
  }
}
