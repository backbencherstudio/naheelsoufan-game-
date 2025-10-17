import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../game_type/riverpod/multiple_choice_provider.dart';
import '../../../../../data/riverpod/function.dart';

final advanceTurnFlagProvider = StateProvider<bool>((ref) => false);

enum AdvanceNavigation { none, leaderboard, nextTurn }

final advanceNavigationProvider =
StateProvider<AdvanceNavigation>((ref) => AdvanceNavigation.none);

final advanceTurnControllerProvider = Provider<void>((ref) {
  ref.listen<bool>(advanceTurnFlagProvider, (previous, next) async {
    if (previous == next) return;
    if (next != true) return;

    await Future.delayed(const Duration(seconds: 1));
    final current = ref.read(playerProvider);
    final currentPlayerTurn = current.currentPlayer;
    final nextPlayerTurn = (currentPlayerTurn + 1) % current.totalPlayer;

    debugPrint("\n\n\nCurrent Player No: $currentPlayerTurn\n\n\n");

    debugPrint('Current Player: $currentPlayerTurn, Next Player: $nextPlayerTurn');

    ref.read(playerProvider.notifier).state = current.copyWith(currentPlayer: nextPlayerTurn);

    debugPrint("\n\n\nCurrent Player No: $currentPlayerTurn\n\n\n");

    // NEED TO UNDERSTAND
     ref.read(huntModeOn.notifier).state = false;
     ref.read(autoCounterProvider(60).notifier).reset();
    // NEED TO UNDERSTAND

    for (final i in [0, 1, 2, 3]) {
      ref.read(checkChoicesProvider(i).notifier).state = -1;
    }
    ref.read(isRightWrongElse.notifier).state = -1;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).reset();
    });

    if (nextPlayerTurn == 0) {
      ref.read(advanceNavigationProvider.notifier).state =
          AdvanceNavigation.leaderboard;
    } else {
      ref.read(advanceNavigationProvider.notifier).state =
          AdvanceNavigation.nextTurn;
    }

    ref.read(advanceTurnFlagProvider.notifier).state = false;
  });
});


