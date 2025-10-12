import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/player/player_game_info.dart';
import 'package:naheelsoufan_game/src/data/repository/player/select_player_service.dart';

final playerGameProvider = StateNotifierProvider<PlayerGameController, PlayerGameInfoResponse?>(
        (ref)=>PlayerGameController(ref)
);

class PlayerGameController extends StateNotifier<PlayerGameInfoResponse?> {
  final Ref ref;
  PlayerGameController(this.ref) : super(null);

  Future<void> fetchGames() async {
    final playerService = SelectPlayersService();
    final gameInfoResponse = await playerService.getPlayerGameInfo();
    state = gameInfoResponse;
  }
}