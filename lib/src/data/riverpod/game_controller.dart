import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/game/game_model.dart';
import '../../core/repository/game/game_repository_implementation.dart';
import '../model/game/game_category_model.dart';
import '../model/game/game_difficulty_model.dart';
import '../model/subcription/subcription_model.dart';

final gameSubscriptionProvider = StateProvider<List<SubscriptionModel?>>((ref) => []);

final gameDifficultyProvider = StateProvider<List<GameDifficultyModel?>>((ref) => []);

final gameCategoryProvider = StateProvider<List<GameCategoryModel?>>((ref) => []);

final gameProvider = StateNotifierProvider<GameNotifier, GameModel?>((ref) => GameNotifier());

class GameNotifier extends StateNotifier<GameModel?> {
  GameNotifier() : super(null);

  // Insert new user data
  void insertData() async{
    final gameData = await GameRepositoryImplementation().getGamePlayerData();
    state = gameData;
  }

  void startGame() async{
    final startMessage = await GameRepositoryImplementation().startGame();
    debugPrint("...startGame... Message: $startMessage");
  }

  void endGame() async{
    final endMessage = await GameRepositoryImplementation().endGame();
    debugPrint("...endGame... Message: $endMessage");
  }

  // Clear data (log out, reset)
  void clearData() => state = null;
}