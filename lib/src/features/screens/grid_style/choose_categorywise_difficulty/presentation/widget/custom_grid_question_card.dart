import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
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
    final currentClickList = ref.watch(isQuestionVanished);
    return GestureDetector(
      onTap: (){
        final updatedList = [...currentClickList, index];
        ref.read(isQuestionVanished.notifier).state = updatedList;
        // SET API CALL HERE

        context.pushReplacement(RouteName.questionRevealedScreen);
      },
      child: CustomDifficultyLevelCard(
        difficulty: difficultyLevel,
        point: difficultyPoint.toString(),
        style: textTheme.bodyLarge!.copyWith(color: (currentClickList.contains(index)) ? AppColorScheme.secondary : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
        backgroundColor: currentClickList.contains(index) ? [
          AppColorScheme.darkYellow,
          AppColorScheme.midYellow,
          AppColorScheme.yellowborder,
        ] : [
          AppColorScheme.sweetViolet,
          AppColorScheme.sweetViolet,
          AppColorScheme.sweetViolet
        ],
        foregroundColor: currentClickList.contains(index) ? [
          AppColorScheme.yellowborder,
          AppColorScheme.midYellow,
          AppColorScheme.darkYellow
        ] : [
          AppColorScheme.listContainerColor,
          AppColorScheme.listContainerColor,
          AppColorScheme.listContainerColor,
        ],
      ),
    );
  }
}