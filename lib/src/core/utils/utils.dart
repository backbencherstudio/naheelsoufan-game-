
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../data/riverpod/count_down_state.dart';
import '../../data/riverpod/function.dart';
import '../../features/screens/game_mode_selection_screens/riverpod/mode_controller.dart';
import '../../features/screens/game_mode_selection_screens/riverpod/player_provider.dart';
import '../../features/screens/game_type/riverpod/multiple_choice_provider.dart';
import '../../features/screens/grid_style/choose_categorywise_difficulty/riverpod/grid_difficulty_provider.dart';
import '../../features/screens/grid_style/choose_multiple_category/riverpod/category_provider.dart';
import '../routes/route_name.dart';

class Utils {
  static String formatTime(DateTime? time) {
    if (time != null) {
      return DateFormat('H:mm').format(time);
    }
    return '--';
  }

  static String formatLunchTime(DateTime? startTime, DateTime? endTime, bool isLunch) {
    if (startTime != null && endTime != null) {
      return '${DateFormat('H').format(startTime)}-${DateFormat('H').format(endTime)}';
    }
    return '--';
  }

  static Future<void> advanceTurnAlternate(BuildContext context, WidgetRef ref) async {

    await Future.delayed(const Duration(seconds: 1));
    final current = ref.read(playerProvider);
    final currentPlayerTurn = current.currentPlayer;
    final nextPlayerTurn = (currentPlayerTurn + 1) % current.totalPlayer;
    final gameMode = ref.read(modeProvider);
    final categoryList = ref.read(categoryListProvider);
    final totalDifficulty = categoryList.length * 3;
    final clickQuestionList = ref.read(isQuestionVanished);

    debugPrint("\n\n\nCurrent Player No: $currentPlayerTurn\n\n\n");
    debugPrint('Current Player: $currentPlayerTurn, Next Player: $nextPlayerTurn');

    // Update player
    ref.read(playerProvider.notifier).state = current.copyWith(currentPlayer: nextPlayerTurn);

    debugPrint("\n\n\nCurrent Player No: $currentPlayerTurn\n\n\n");

    // Reset hunt mode & timer
    ref.read(huntModeOn.notifier).state = false;
    ref.read(autoCounterProvider(60).notifier).reset();

    // Reset answer selections
    for (final i in [0, 1, 2, 3]) {
      ref.read(checkChoicesProvider(i).notifier).state = -1;
    }
    ref.read(isRightWrongElse.notifier).state = -1;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).reset();
    });

    // Navigation updates
    if (gameMode != 3) {
      if (nextPlayerTurn == 0) {
        context.pushReplacement(RouteName.leaderboardScreen);
      } else {
        context.pushReplacement(RouteName.nextTurnScreen);
      }
    } else {
      if (totalDifficulty <= clickQuestionList.length) {
        ref.invalidate(playerProvider);
        ref.invalidate(isQuestionVanished);
        ref.invalidate(isQuestionVanishTeam2);
        ref.invalidate(isQuestionVanishTeam1);
        ref.invalidate(categoryListProvider);
        ref.invalidate(isCategorySelectedClicked);
        ref.invalidate(isSomethingClicked);
        context.pushReplacement(RouteName.gridLeaderboard);
      } else {
        context.pushReplacement(RouteName.nextTurnScreen);
      }
    }
  }
}
