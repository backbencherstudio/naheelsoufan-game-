import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_services.dart';

class AnswerQuestionService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();


  Future<bool> answer(String? qId, String? aId, String? pId, String? answerText) async {
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

    final body2 = {
      "game_id": gameId,
      "question_id": qId,
      "answer_id": aId,
      "player_id": pId,
      "answer_text": answerText
    };

    (answerText != null) ? debugPrint("answer: $body2") : debugPrint('answer: $body');

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.answer,
        body: (answerText != null) ? body2 : body,
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

  Future<bool> skipAnswer(String? qId, String? pId) async {
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
      "player_id": pId
    };

    try {
      final response = await _apiServices.postData(
        endPoint: ApiEndPoints.skipAnswer,
        body: body,
        headers: headers,
      );

      if(response['success'] == true) {
        debugPrint('Skipped Answer ====== $response');
        return response['success'];
      }
      else {
        debugPrint("skip answer response: $response");
        return false;
      }

    } catch (e) {
      print('Error during skip question: $e');
      return false;
    }
  }
}
