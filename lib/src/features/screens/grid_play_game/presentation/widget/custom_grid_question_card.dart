import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/custom_difficulty_level_card.dart';
import '../../riverpod/function.dart';

class CustomGridQuestionCard extends ConsumerWidget {
  final String questionId;
  final String? questionLevel;
  final String questionCategory;

  const CustomGridQuestionCard({
    super.key,
    required this.questionId,
    this.questionLevel,
    required this.questionCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final clickedStatus1 = ref.watch(isDifficultyClicked1(int.parse(questionId)));
    final clickedStatus2 = ref.watch(isDifficultyClicked2(int.parse(questionId)));
    final clickedStatus3 = ref.watch(isDifficultyClicked3(int.parse(questionId)));
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: isPortrait ? 56.h : 25.2.w,
          width: isPortrait ? 114.w : 250.8.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColorScheme.surface,
                AppColorScheme.midGradGreen,
                AppColorScheme.hardGradGreen,
              ]),
              borderRadius: BorderRadius.circular(26.4.r),
              border: Border.all(width: isPortrait ? 2.w : 4.4.h, color: AppColorScheme.greenborder)
          ),
          child: RichText(text: TextSpan(text: questionCategory, style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400, fontSize: 6.3.sp
          )
          ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: isPortrait ? 16.h : 7.2.w,),
        CustomDifficultyLevelCard(
          difficulty: "EASY",
          point: "100",
          style: textTheme.bodyLarge!.copyWith(color: ref
              .read(isDifficultyClicked1(int.parse(questionId)).notifier)
              .state ? AppColorScheme.secondary : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
          backgroundColor: ref
              .read(isDifficultyClicked1(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.darkYellow,
            AppColorScheme.midYellow,
            AppColorScheme.yellowborder,
          ] : [
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet
          ],
          foregroundColor:ref
              .read(isDifficultyClicked1(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.yellowborder,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow
          ] : [
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
          ],
        ),
        SizedBox(height: isPortrait ? 8.h : 3.6.w,),
        CustomDifficultyLevelCard(
          difficulty: "MEDIUM",
          point: "200",
          style: textTheme.bodyLarge!.copyWith(color: ref
              .read(isDifficultyClicked2(int.parse(questionId)).notifier)
              .state ? AppColorScheme.secondary : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
          backgroundColor: ref
              .read(isDifficultyClicked2(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.darkYellow,
            AppColorScheme.midYellow,
            AppColorScheme.yellowborder,
          ] : [
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet
          ],
          foregroundColor:ref
              .read(isDifficultyClicked2(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.yellowborder,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow
          ] : [
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
          ],
        ),
        SizedBox(height: isPortrait ? 8.h : 3.6.w,),
        CustomDifficultyLevelCard(
          difficulty: "HARD",
          point: "400",
          style: textTheme.bodyLarge!.copyWith(color: ref
              .read(isDifficultyClicked3(int.parse(questionId)).notifier)
              .state ? AppColorScheme.secondary : AppColorScheme.difficultyTextColor, fontSize: 7.2.sp),
          backgroundColor: ref
              .read(isDifficultyClicked3(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.darkYellow,
            AppColorScheme.midYellow,
            AppColorScheme.yellowborder,
          ] : [
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet,
            AppColorScheme.sweetViolet
          ],
          foregroundColor:ref
              .read(isDifficultyClicked3(int.parse(questionId)).notifier)
              .state ? [
            AppColorScheme.yellowborder,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow
          ] : [
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
          ],
        ),
      ],
    );
  }
}