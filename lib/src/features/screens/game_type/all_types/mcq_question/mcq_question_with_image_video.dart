import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/audio_part.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/video_part.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../../riverpod/multiple_choice_provider.dart';
import 'widget/image_part.dart';

class McqQuestionWithImageVideo extends StatelessWidget {
  final List<String> choices;
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  final String? audioUrl;
  final int? rightIndex;
  const McqQuestionWithImageVideo({
    super.key,
    required this.choices,
    required this.question,
    this.imageUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.rightIndex,
    this.audioUrl
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
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        ///Image part\
        if (imageUrl != null) ImagePart(imageUrl: imageUrl),

        ///video part
        if (videoUrl != null) VideoPart(thumbnailUrl: videoThumbnailUrl, videoUrl: videoUrl!),

        ///audio part
        if (audioUrl != null)
          AudioPart(
            audioUrl: audioUrl!,
          ),

        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3, // Wider buttons
          ),
          itemBuilder: (context, index) {
            return Consumer(
              builder: (_, ref, _) {
                final controller = ref.read(playerProvider.notifier);
                final current = ref.read(playerProvider);
                final next = (current.currentPlayer + 1) % current.totalPlayer;
                final huntMode = ref.watch(huntModeOn);
                final checkChoice = ref.watch(checkChoicesProvider(index));
                final rightChoiceIndex = rightIndex ?? 0;
                final response = ref.watch(questionResponseProvider);
                return InkWell(
                  onTap: () {
                    (index == rightChoiceIndex) ? ref.read(isRightWrongElse.notifier).state = 1 : ref.read(isRightWrongElse.notifier).state = 0;

                    for (int i = 0; i < choices.length; i++) {
                      if (i == index) {
                        ref.read(checkChoicesProvider(i).notifier).state =
                        (i == rightChoiceIndex) ? 1 : 0;
                      } else {
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
