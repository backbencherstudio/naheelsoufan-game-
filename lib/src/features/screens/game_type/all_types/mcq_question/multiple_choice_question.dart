import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  final List<String> choices;
  final Function? func;
  final String question;
  final int? rightIndex;

  const MultipleChoiceQuestion({
    super.key,
    required this.choices,
    required this.question,
    this.rightIndex,
    this.func,
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
                      ref.read(isCorrectQuiz.notifier).state = true;
                      ref.read(huntModeOn.notifier).state = !huntMode;

                      log("\n\n\nWRONG!!!\n\n\n");
                      if(huntMode == true){
                        func!();
                        controller.state = current.copyWith(currentPlayer: next);
                      } else {
                        ref.read(autoCounterProvider(60).notifier).reset();
                        onWrongAnswerTap(context, choices[rightChoiceIndex], ref);
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref.read(autoCounterProvider(60).notifier).reset();
                      });
                    } else {
                      func!(); //LOGIC ekhane dite hobe
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





// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
// import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
// import 'package:naheelsoufan_game/src/features/screens/game_type/riverpod/multiple_choice_provider.dart';
// import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
// import 'package:naheelsoufan_game/src/features/screens/question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';
// import '../../../../../data/riverpod/count_down_state.dart';
// import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
// import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
//
// import '../../../../../core/routes/route_name.dart';
//
// class MultipleChoiceQuestion extends StatelessWidget {
//   final List<String> choices;
//   final Function? func;
//   final String question;
//   final int? rightIndex;
//
//   const MultipleChoiceQuestion({
//     super.key,
//     required this.choices,
//     required this.question,
//     this.rightIndex,
//     this.func,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     List<int>listID = [0, 1, 2, 3];
//     return Column(
//       children: [
//         Text(
//           question,
//           style: textTheme.bodyLarge?.copyWith(
//             fontWeight: FontWeight.w500,
//             fontSize: isPortrait ? 24.sp : 10.8.sp,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: isPortrait ? 40.h : 18.w),
//         GridView.builder(
//           itemCount: choices.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: isPortrait ? 8.w : 17.6.h,
//             crossAxisSpacing: isPortrait ? 8.w : 17.6.h,
//             childAspectRatio: isPortrait ? 3 : 4,
//           ),
//           itemBuilder: (context, index) {
//             return Consumer(
//               builder: (_, ref, _) {
//                 final checkChoice = ref.watch(checkChoicesProvider(index));
//                 final rightChoiceIndex = rightIndex ?? 0;
//                 final controller = ref.read(playerProvider.notifier);
//                 final current = ref.read(playerProvider);
//                 final next = (current.currentPlayer + 1) % current.totalPlayer;
//                 return InkWell(
//                   onTap: () {
//                     (index == rightChoiceIndex)
//                         ? ref.read(isRightWrongElse.notifier).state = 1
//                         : ref.read(isRightWrongElse.notifier).state = 0;
//                     for (int i = 0; i < choices.length; i++) {
//                       if (i == index) {
//                         ref.read(checkChoicesProvider(i).notifier).state =
//                             (i == rightChoiceIndex) ? 1 : 0;
//                       } else {
//                         ref.read(resetVersionProvider.notifier).state++;
//                       }
//                     }
//                     if (
//                     !(ref.read(isCorrectQuiz.notifier).state) &&
//                         rightChoiceIndex != index) {
//                       ref.read(resetVersionProvider.notifier).state++;
//                       ref.read(selectedPlayerIndexProvider.notifier).state = -1;
//                       ref.read(isCorrectQuiz.notifier).state = true;
//                       ref.read(huntModeOn.notifier).state = true;
//                       for (final id in listID) {
//                         ref.read(checkChoicesProvider(id).notifier).state = -1;
//                       }
//                       WidgetsBinding.instance.addPostFrameCallback((_) {
//                         ref.read(autoCounterProvider(60).notifier).start();
//                       });
//                       onWrongAnswerTap(context, ref);
//                     } else {
//                       func!();
//                     }
//                     controller.state = current.copyWith(currentPlayer: next); // CB
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         isPortrait ? 12.r : 26.4.r,
//                       ),
//                       gradient: LinearGradient(
//                         colors:
//                             (ref
//                                         .read(
//                                           checkChoicesProvider(index).notifier,
//                                         )
//                                         .state ==
//                                     1)
//                                 ? [
//                                   AppColorScheme.startGradGreen,
//                                   AppColorScheme.midGradGreen,
//                                   AppColorScheme.hardGradGreen,
//                                 ]
//                                 : (ref
//                                         .read(
//                                           checkChoicesProvider(index).notifier,
//                                         )
//                                         .state ==
//                                     0)
//                                 ? [
//                                   AppColorScheme.errorColor,
//                                   AppColorScheme.errorColor,
//                                   AppColorScheme.errorColor,
//                                 ]
//                                 : [
//                                   AppColorScheme.optionBg,
//                                   AppColorScheme.optionBg,
//                                   AppColorScheme.optionBg,
//                                 ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColorScheme.answerBoxShadow,
//                           blurRadius: isPortrait ? 25.r : 55.r,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                       border: Border(
//                         bottom: BorderSide(
//                           color:
//                               (ref
//                                           .read(
//                                             checkChoicesProvider(
//                                               index,
//                                             ).notifier,
//                                           )
//                                           .state ==
//                                       1)
//                                   ? AppColorScheme.rightOptionBorderColor
//                                   : (ref
//                                           .read(
//                                             checkChoicesProvider(
//                                               index,
//                                             ).notifier,
//                                           )
//                                           .state ==
//                                       0)
//                                   ? AppColorScheme.optionBg
//                                   : AppColorScheme.labelTextColor,
//                           width: isPortrait ? 4.r : 8.8.r,
//                         ),
//                       ),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       choices[index],
//                       style: textTheme.bodyLarge!.copyWith(
//                         fontSize: isPortrait ? 16.sp : 7.2.sp,
//                         color: AppColorScheme.labelTextColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
