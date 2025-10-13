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

  Future<bool> createGame({required context, required int gameMode}) async {
    final modeName = (gameMode == 3) ? "GRID_STYLE" : "QUICK_GAME";
    final token = await _tokenService.getToken();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return false;
    }
    /// NEED REFACTOR AFTER LOCALIZATION
    final languageId = await _languageIdService.getToken();
    /// NEED REFACTOR AFTER LOCALIZATION
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};

    try {
      final response = await _apiServices.postData(
        endPoint: (gameMode == 2) ? ApiEndPoints.createOnlineGameUrl : ApiEndPoints.createGameUrl,
        body: {"language_id": languageId, "mode": modeName},
        headers: headers,
      );

      if (response['success'] == true) {
        print('Game mode select call successful: $response');
        debugPrint('game id ============${response['data']['id']}');
        await _gameIdStorage.setGameId(response['data']['id']);
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
