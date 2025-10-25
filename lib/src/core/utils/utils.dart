import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:string_similarity/string_similarity.dart';
import '../../data/riverpod/count_down_state.dart';
import '../../data/riverpod/function.dart';
import '../../data/riverpod/subscription/subscription_controller.dart';
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

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }



  static bool isAnswerCorrect(String correctAnswer, String userAnswer) {
    correctAnswer = correctAnswer.trim().toLowerCase();
    userAnswer = userAnswer.trim().toLowerCase();

    // Check for numeric range format like "60-65"
    final rangePattern = RegExp(r'^(\d+)\s*-\s*(\d+)$');
    final match = rangePattern.firstMatch(correctAnswer);

    if (match != null) {
      // It's a numeric range
      final min = double.parse(match.group(1)!);
      final max = double.parse(match.group(2)!);
      final userValue = double.tryParse(userAnswer);
      if (userValue != null) {
        return userValue >= min && userValue <= max;
      }
      return false;
    }

    // Otherwise, use string similarity
    double similarity = userAnswer.similarityTo(correctAnswer);

    // You can adjust this threshold (0.7–0.85 is typical)
    return similarity >= 0.7;
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
    final questionCount = ref.watch(questionCountProvider);

    final userSubscriptionQuestionData = ref.read(userSubscriptionDataProvider.notifier).state?.data.subscriptionType.questions ?? 0;

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

    ref.read(questionCountProvider.notifier).state++;

    log("\n\n\nTurn Number: $questionCount\n\n\n");

    // Navigation updates
    if (gameMode != 3) {
      if (questionCount == (current.totalPlayer * userSubscriptionQuestionData) - 1) {
        ref.read(questionCountProvider.notifier).state = 0;
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
        context.pushReplacement(RouteName.leaderboardScreen);
      } else {
        context.pushReplacement(RouteName.nextTurnScreen);
      }
    }
  }
}
