import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/game_result_model.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/game_stats_model.dart';

import '../../../../core/services/token_services.dart';

class GetGameStatsService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();

  Future<GameResult?> getGameStats() async {
    final token = await _tokenService.getToken();
    final gameId = await _gameIdStorage.getGameId();
    final body = {
      "game_id": gameId
    };

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.gameStatsUrl,
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response['success'] == true) {
        print('player select successful: $response');
        final gameStatsModel = GameResult.fromJson(response);
        debugPrint('Game ID in STats ====== ${gameStatsModel.data.finalRankings.first.playerName}');
        return gameStatsModel;
      } else {
        print('Game ID in STats API call failed: ${response.toString()}');
        return null;
      }
    } catch (e) {
      print('Error during select player call: $e');
      return null;
    }
  }
}
