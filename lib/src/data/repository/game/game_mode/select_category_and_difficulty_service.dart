import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';
import 'package:naheelsoufan_game/src/data/model/player/player_model.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/start_game_question_model.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_services.dart';

class SelectCategoriesAndDifficultiesService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();

  Future<GameQuestionResponse?> selectCategoryAndDifficulty(String? catId, String? dogId) async {
    final token = await _tokenService.getToken();
    final gameId = await _gameIdStorage.getGameId();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return null;
    }

    final headers = {'Authorization': 'Bearer $token'};

    final body = {
      "game_id": gameId,
      "category_id": catId,
      "difficulty_id": dogId
    };

    debugPrint('id, cate and diff: $body');

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.startGameUrl,
        body: body,
        headers: headers,
      );

      if (response['success'] == true) {
        print('player select successful: $response');
        final gameModel = GameQuestionResponse.fromJson(response);
        debugPrint('Game ====== ${gameModel.data.question.id}');
        return gameModel;
      } else {
        print('API call failed: ${response.toString()}');
        return null;
      }
    } catch (e) {
      print('Error during select player call: $e');
      return null;
    }
  }
}
