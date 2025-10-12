import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/services/game_id_storage.dart';
import 'package:naheelsoufan_game/src/core/services/language_services.dart';
import 'package:naheelsoufan_game/src/data/model/player/player_game_info.dart';
import 'package:naheelsoufan_game/src/data/model/player/player_model.dart';

import '../../../core/services/api_services.dart';
import '../../../core/services/token_services.dart';

class SelectPlayersService {
  final ApiServices _apiServices = ApiServices();
  final GameIdStorage _gameIdStorage = GameIdStorage();
  final TokenService _tokenService = TokenService();

  Future<PlayerModel?> selectPlayers({required context, required List<String> players}) async {
    final token = await _tokenService.getToken();
    final gameId = await _gameIdStorage.getGameId();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return null;
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
        final playerModel = PlayerModel.fromJson(response);
        debugPrint('player 1 ====== ${playerModel.data.players.first.playerName}');
        return playerModel;
      } else {
        print('API call failed: ${response.toString()}');
        return null;
      }
    } catch (e) {
      print('Error during select player call: $e');
      return null;
    }
  }

  Future<PlayerGameInfoResponse?> getPlayerGameInfo() async{
    final token = await _tokenService.getToken();

    if (token == null || token.isEmpty) {
      debugPrint('Token not found, please login');
      return null;
    }

    final headers = {'Authorization': 'Bearer $token'};

    try {
      final response = await _apiServices.getData(
        endPoint: ApiEndPoints.playerGameStats,
        headers: headers,
      );

      if (response['success'] == true) {
        debugPrint('Get Player Game Successful: $response');
        final playerGameModel = PlayerGameInfoResponse.fromJson(response);
        return playerGameModel;
      } else {
        debugPrint('API call failed: ${response.toString()}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching player game info: $e');
      return null;
    }
  }
}
