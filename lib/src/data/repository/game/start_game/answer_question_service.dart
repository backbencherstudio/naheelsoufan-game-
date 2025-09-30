import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_services.dart';

class AnswerQuestionService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();


  Future<bool> answer(String? qId, String? aId, String? pId) async {
    final token = await _tokenService.getToken();
    final gameId = await _gameIdStorage.getGameId();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return false;
    }

    final headers = {'Authorization': 'Bearer $token'};

    final body = {
      "game_id": gameId,
      "question_id": qId,
      "answer_id": aId,
      "player_id": pId
    };

    debugPrint('answer: $body');

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.answer,
        body: body,
        headers: headers,
      );

      if(response['success'] == true) {

        debugPrint('Answer ====== ${response['data']['is_correct']}');
        return response['data']['is_correct'];
      }
      else {
        return false;
      }

    } catch (e) {
      print('Error during select player call: $e');
      return false;
    }
  }
}
