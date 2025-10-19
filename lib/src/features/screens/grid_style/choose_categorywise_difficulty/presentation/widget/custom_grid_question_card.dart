import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/player_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/custom_difficulty_level_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/riverpod/grid_difficulty_provider.dart';
import '../../../../../../core/routes/route_name.dart';

class CustomGridQuestionCard extends ConsumerWidget {
  final int index;
  final String difficultyId;
  final String difficultyLevel;
  final int? difficultyPoint;
  final String categoryId;
  final Function()? onTap;

  const CustomGridQuestionCard({
    super.key,
    required this.index,
    required this.difficultyId,
    required this.difficultyLevel,
    required this.difficultyPoint,
    required this.categoryId,
    this.onTap
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final player = ref.watch(playerProvider);
    final bothClickList = ref.watch(isQuestionVanished);
    final team1ClickList = ref.watch(isQuestionVanishTeam1);
    final team2ClickList = ref.watch(isQuestionVanishTeam2);
    return GestureDetector(
      onTap: (){
        if(bothClickList.contains(index)){
          return;
        }
        if((player.currentPlayer == 0) && (team1ClickList.contains(index))){
          return;
        }if((player.currentPlayer == 1) && (team2ClickList.contains(index))){
          return;
        }
        if((player.currentPlayer == 0) && (team2ClickList.contains(index))) {
            final updatedList = [...bothClickList, index];
            ref.read(isQuestionVanished.notifier).state = updatedList;
        }
        if((player.currentPlayer == 1) && (team1ClickList.contains(index))) {
          final updatedList = [...bothClickList, index];
          ref.read(isQuestionVanished.notifier).state = updatedList;
        }
        final updatedList = (player.currentPlayer == 0) ? [...team1ClickList, index] : [...team2ClickList, index];
        (player.currentPlayer == 0) ? ref.read(isQuestionVanishTeam1.notifier).state = updatedList : ref.read(isQuestionVanishTeam2.notifier).state = updatedList;
        // SET API CALL HERE

        context.pushReplacement(RouteName.questionRevealedScreen);
      },
      child: CustomDifficultyLevelCard(
        team1Done: team1ClickList.contains(index),
        team2Done: team2ClickList.contains(index),
        difficulty: difficultyLevel,
        point: difficultyPoint.toString(),
        style: textTheme.bodyLarge!.copyWith(color: (bothClickList.contains(index)) ? AppColorScheme.sweetViolet : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
      ),
    );
  }
}