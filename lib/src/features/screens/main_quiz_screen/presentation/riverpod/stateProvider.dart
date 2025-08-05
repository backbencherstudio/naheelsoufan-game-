import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/riverpod/player_manage.dart';

final selectedPlayerIndexProvider = StateProvider<int>((ref) => -1);

final playerProvider = StateProvider<PlayerManage>((ref)=>PlayerManage(
    totalPlayer: 2,
    currentPlayer: 0,
    stealPlayer: -1
));

final isCorrectQuiz = StateProvider<bool>((ref) {
  return false;
});

final isWrongPoped = StateProvider<bool>((ref)=>false);

