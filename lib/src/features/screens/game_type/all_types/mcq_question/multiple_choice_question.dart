import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  final List<String> choices;
  final String question;
  final int? rightIndex;

  const MultipleChoiceQuestion({
    super.key,
    required this.choices,
    required this.question,
    this.rightIndex,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        Text(
          question,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: isPortrait ? 24.sp : 10.8.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isPortrait ? 40.h : 18.w),
        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: isPortrait ? 8.w : 17.6.h,
            crossAxisSpacing: isPortrait ? 8.w : 17.6.h,
            childAspectRatio: isPortrait ? 3 : 4,
          ),
          itemBuilder: (context, index) {
            return Consumer(
              builder: (_, ref, _) {

                final checkChoice = ref.watch(checkChoicesProvider(index));
                final rightChoiceIndex = rightIndex ?? 0;
                final controller = ref.read(playerProvider.notifier);
                final current = ref.read(playerProvider);
                final next = (current.currentPlayer + 1) % current.totalPlayer;
                final huntMode = ref.watch(huntModeOn);
                final response = ref.watch(questionResponseProvider);

                return InkWell(
                  // CHANGE
                  onTap: () {
                    (index == rightChoiceIndex) ? ref.read(isRightWrongElse.notifier).state = 1 : ref.read(isRightWrongElse.notifier).state = 0;

                    for (int i = 0; i < choices.length; i++) {
                      if (i == index) {
                        ref.read(checkChoicesProvider(i).notifier).state =
                        (i == rightChoiceIndex) ? 1 : 0;
                      }
                      else {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }
                    }

                    if (ref.read(isRightWrongElse.notifier).state == 0) {
                      for (int i = 0; i < 4; i++) {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }
                      ref.read(selectedPlayerIndexProvider.notifier).state = -1;
                      ref.read(huntModeOn.notifier).state = !huntMode;

                      log("\n\n\nWRONG!!!\n\n\n");
                      if(huntMode == true){
                        ref.read(advanceTurnFlagProvider.notifier).state = true;
                        controller.state = current.copyWith(currentPlayer: next);
                      } else {
                        ref.read(autoCounterProvider(response?.data?.question.timeLimit ?? 60).notifier).reset();
                        onWrongAnswerTap(context, choices[rightChoiceIndex], ref);
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref.read(autoCounterProvider(response?.data?.question.timeLimit ?? 60).notifier).reset();
                      });
                    } else {
                      ref.read(advanceTurnFlagProvider.notifier).state = true;
                      controller.state = current.copyWith(currentPlayer: next); // CB
                    }
                    log("is wrong = $huntMode");
                  },
                  // CHANGE
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isPortrait ? 12.r : 26.4.r,
                      ),
                      gradient: LinearGradient(
                        colors:
                        (checkChoice ==
                            1)
                            ? [
                          AppColorScheme.startGradGreen,
                          AppColorScheme.midGradGreen,
                          AppColorScheme.hardGradGreen,
                        ]
                            : (checkChoice ==
                            0)
                            ? [
                          AppColorScheme.errorColor,
                          AppColorScheme.errorColor,
                          AppColorScheme.errorColor,
                        ]
                            : [
                          AppColorScheme.optionBg,
                          AppColorScheme.optionBg,
                          AppColorScheme.optionBg,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColorScheme.answerBoxShadow,
                          blurRadius: isPortrait ? 25.r : 55.r,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border(
                        bottom: BorderSide(
                          color:
                          (checkChoice ==
                              1)
                              ? AppColorScheme.rightOptionBorderColor
                              : (checkChoice ==
                              0)
                              ? AppColorScheme.optionBg
                              : AppColorScheme.labelTextColor,
                          width: isPortrait ? 4.r : 8.8.r,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      choices[index],
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: isPortrait ? 16.sp : 7.2.sp,
                        color: AppColorScheme.labelTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}