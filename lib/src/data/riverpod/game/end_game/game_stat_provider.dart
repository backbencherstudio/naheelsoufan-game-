import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/game_result_model.dart';
import 'package:naheelsoufan_game/src/data/model/start_game/game_stats_model.dart';

final gameStatsProvider = StateProvider<GameResult?>((ref)=> null);