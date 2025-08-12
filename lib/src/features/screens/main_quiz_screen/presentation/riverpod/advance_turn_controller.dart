import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../game_type/riverpod/multiple_choice_provider.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';

final advanceTurnFlagProvider = StateProvider<bool>((ref) => false);

enum AdvanceNavigation { none, leaderboard, nextTurn }

final advanceNavigationProvider =
StateProvider<AdvanceNavigation>((ref) => AdvanceNavigation.none);

final advanceTurnControllerProvider = Provider.autoDispose<void>((ref) {
  ref.listen<bool>(advanceTurnFlagProvider, (previous, next) async {
    if (previous == next) return;
    if (next != true) return;

    await Future.delayed(const Duration(seconds: 1));

    final currentPlayerTurn = ref.read(playerTurnProvider);
    final current = ref.read(playerProvider);
    final nextPlayerTurn =
        (currentPlayerTurn + 1) % current.totalPlayer;


    ref.read(playerTurnProvider.notifier).state = nextPlayerTurn;
    ref.read(playerNo.notifier).state = current.currentPlayer;


    ref.read(huntModeOn.notifier).state = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).reset();
    });

    if (nextPlayerTurn == 0) {
      ref.read(advanceNavigationProvider.notifier).state =
          AdvanceNavigation.leaderboard;
      ref.read(playerTurnProvider.notifier).state = 1;
    } else {
      for (final i in [0, 1, 2, 3]) {
        ref.read(checkChoicesProvider(i).notifier).state = -1;
      }
      ref.read(isRightWrongElse.notifier).state = -1;
      ref.read(selectedPlayerIndexProvider.notifier).state = -1;
      ref.read(advanceNavigationProvider.notifier).state =
          AdvanceNavigation.nextTurn;
    }

    ref.read(advanceTurnFlagProvider.notifier).state = false;
  });
});



//ref.read(isCorrectQuiz.notifier).state = false;