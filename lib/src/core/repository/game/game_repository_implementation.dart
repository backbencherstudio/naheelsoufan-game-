import 'package:flutter/cupertino.dart';
import 'package:naheelsoufan_game/src/core/services/api_services.dart';
import 'package:naheelsoufan_game/src/data/model/game/game_category_model.dart';
import '../../../data/model/game/game_model.dart';
import '../../services/api_end_points.dart';
import '../../services/shared_prefernce_services.dart';
import 'game_repository.dart';

class GameRepositoryImplementation extends GameRepository{

  // Create Game
  @override
  Future<bool> createService(String gameMode, String languageId) async {
    try{
      ApiServices apiServices = ApiServices();
      final token = await SharedPreference().getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Token not found, please login');
        return false;
      }
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await apiServices.postData(
          body: {
            "language_id": languageId,
            "mode": gameMode
          }, endPoint: ApiEndPoints.createGameUrl,
        headers: headers
      );
      debugPrint("\n\n\nMESSAGE: ${response["message"]}\n\n\n");
      if(response['success'] == true) {
        await SharedPreference().setGameId(response['data']['id']);
        debugPrint("\n\n\nGAME ID: ${await SharedPreference().getGameId()}\n\n\n");
        return true;
      }
    }catch(e){
      return false;
    }
    return false;
  }


  @override
  Future<GameModel?> getGamePlayerData() async {
    try{
      ApiServices apiServices = ApiServices();
      final gameId = await SharedPreference().getGameId();

      final response = await apiServices.getData(
          endPoint: "${ApiEndPoints.gamePlayerDataUrl}/$gameId",
      );
      return GameModel.fromJson(response['data']);
    }
    catch(e) {
      debugPrint("...getGamePlayerData... Error: $e");
      return null;
    }
  }

  Future<String?> startGame() async {
    try{
      ApiServices apiServices = ApiServices();
      final gameId = await SharedPreference().getGameId();

      final response = await apiServices.postData(
        endPoint: ApiEndPoints.gameStartUrl,
        body: {
          "game_id": gameId
        }
      );
      return response['message'];
    }
    catch(e) {
      debugPrint("...startGame... Error: $e");
      return null;
    }
  }

  Future<String?> endGame() async {
    try{
      ApiServices apiServices = ApiServices();
      final gameId = await SharedPreference().getGameId();

      final response = await apiServices.postData(
          endPoint: ApiEndPoints.gameEndUrl,
          body: {
            "game_id": gameId
          }
      );
      return response['message'];
    }
    catch(e) {
      debugPrint("...endGame... Error: $e");
      return null;
    }
  }

  Future<GameCategoryModel?> getGameCategory() async {
    try{
      ApiServices apiServices = ApiServices();
      final gameId = await SharedPreference().getGameId();

      final response = await apiServices.getData(
        endPoint: "${ApiEndPoints.gameCategoryUrl}/$gameId",
      );
      return GameCategoryModel.fromJson(response['data']['categories']);
    }
    catch(e) {
      debugPrint("...getGameCategoryData... Error: $e");
      return null;
    }
  }

}