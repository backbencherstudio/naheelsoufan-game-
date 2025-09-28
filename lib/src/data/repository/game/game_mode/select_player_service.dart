import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';
import 'package:naheelsoufan_game/src/core/services/language_services.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_services.dart';

class SelectPlayersService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();

  Future<bool> selectPlayers({required context, required List<String> players}) async {
    final token = await _tokenService.getToken();
    final gameId = await _gameIdStorage.getGameId();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return false;
    }

    final headers = {'Authorization': 'Bearer $token'};

    final body = {
      "game_id": gameId,
      "player_names": players
    };

    debugPrint('players: $body');

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.selectPlayersUrl,
        body: body,
        headers: headers,
      );

      if (response['success'] == true) {
        print('player select successful: $response');
        
        return true;
      } else {
        print('API call failed: ${response.toString()}');
        return false;
      }
    } catch (e) {
      print('Error during select player call: $e');
      return false;
    }
  }
}
