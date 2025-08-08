import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import '../../features/screens/grid_play_game/riverpod/function.dart';
import '../../features/screens/main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../features/screens/main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../features/screens/question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';
import 'count_down_state.dart';

final commonProviderDisposer = Provider<void Function()>((ref) {
  return () {
    for (int i = 0; i < 4; i++) {
      ref.invalidate(checkChoicesProvider(i));
    }
    ref.invalidate(isDifficultyClicked3);
    ref.invalidate(isDifficultyClicked2);
    ref.invalidate(isDifficultyClicked1);
    ref.invalidate(isDifficultyVanished);
    ref.invalidate(isSomethingClicked);
    ref.invalidate(isSelectedClicked);
    ref.invalidate(isRightWrongElse);
    ref.invalidate(isCorrectQuiz);
    ref.invalidate(selectedPlayerIndexProvider);
    ref.invalidate(huntModeOn);
    ref.invalidate(autoCounterProvider(60));
    ref.invalidate(playerProvider);

    // Reset player number to 0
    ref.read(playerNo.notifier).state = 0;

    // Optional: reset turn to first player too
    ref.read(playerTurnProvider.notifier).state = 0;

    // Optional: reset any other player-related state
    ref.read(selectedPlayerIndexProvider.notifier).state = -1;
  };
});