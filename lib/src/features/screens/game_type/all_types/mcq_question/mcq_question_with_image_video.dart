import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/notify_sound/notify_sounds.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/audio_part.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/all_types/mcq_question/widget/video_part.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/function.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../game_mode_selection_screens/riverpod/mode_controller.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/wrong_answer_dialog.dart';
import '../../../quick_play_offline/question_answer/provider/toggle.dart';
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
    this.audioUrl,
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
        if (audioUrl != null) AudioPart(audioUrl: audioUrl!),

        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // fixed number of columns
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.w,
            childAspectRatio: 6,
          ),
          itemBuilder: (context, index) {
            return Consumer(
              builder: (_, ref, _) {
                final huntMode = ref.watch(huntModeOn);
                final checkChoice = ref.watch(checkChoicesProvider(index));
                final rightChoiceIndex = rightIndex ?? 0;
                final playerList = ref.watch(playerListProvider);
                final player = ref.watch(playerProvider);
                final selectedPointBlock = ref.watch(
                  selectedPlayerIndexProvider,
                );
                final response = ref.watch(questionResponseProvider);
                final mode = ref.watch(modeProvider);

                return InkWell(
                  onTap: () async {
                    (index == rightChoiceIndex)
                        ? ref.read(isRightWrongElse.notifier).state = 1
                        : ref.read(isRightWrongElse.notifier).state = 0;

                    for (int i = 0; i < choices.length; i++) {
                      if (i == index) {
                        ref.read(checkChoicesProvider(i).notifier).state =
                            (i == rightChoiceIndex) ? 1 : 0;
                      } else {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }
                    }

                    (!huntMode)
                        ? await AnswerQuestionService().answer(
                          response?.data?.question.id,
                          response?.data?.question.answers[index].id,
                          response?.data?.currentPlayer.id,
                          null,
                        )
                        : null;

                    if (ref.read(isRightWrongElse.notifier).state == 0) {
                      for (int i = 0; i < 4; i++) {
                        ref.read(checkChoicesProvider(i).notifier).state = -1;
                      }

                      log("\n\n\nWRONG!!!\n\n\n");
                      NotifySounds().playWrongSound();
                      if (huntMode == true) {
                        if (selectedPointBlock == -1 ||
                            selectedPointBlock == player.currentPlayer) {

                          if(mode == 3) {
                            final result = await AnswerQuestionService().answer(
                              response?.data?.question.id,
                              response?.data?.question.answers[index].id,
                              playerList?.data?.players[(player.currentPlayer + 1) % player.totalPlayer].id,
                              null,
                            );
                            log("Grid Result: $result");
                            await Utils.advanceTurnAlternate(context, ref);
                          }
                          else {
                            log("Please Select a Player");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please Select a Player"),
                              ),
                            );
                          }
                        } else {
                          log(
                            "Selected Player ID: ${playerList?.data?.players[selectedPointBlock].id}",
                          );
                          final result = await AnswerQuestionService().answer(
                            response?.data?.question.id,
                            response?.data?.question.answers[index].id,
                            playerList?.data?.players[selectedPointBlock].id,
                            null,
                          );
                          //log("Hunt Result: $result");
                          ref.read(selectedPlayerIndexProvider.notifier).state =
                              -1;
                          ref.read(huntModeOn.notifier).state = false;
                          await Utils.advanceTurnAlternate(context, ref);
                        }
                      } else {
                        ref
                            .read(
                              autoCounterProvider(
                                response?.data?.question.timeLimit ?? 60,
                              ).notifier,
                            )
                            .reset();
                        onWrongAnswerTap(
                          context,
                          choices[rightChoiceIndex],
                          ref,
                        );
                        ref.read(huntModeOn.notifier).state = true;
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(
                              autoCounterProvider(
                                response?.data?.question.timeLimit ?? 60,
                              ).notifier,
                            )
                            .reset();
                      });
                    } else {
                      log("\n\n\nRIGHT!!!\n\n\n");
                      NotifySounds().playCorrectSound();
                      if (huntMode == true) {
                        if (selectedPointBlock == -1 ||
                            selectedPointBlock == player.currentPlayer) {
                          if(mode == 3) {
                            final result = await AnswerQuestionService().answer(
                              response?.data?.question.id,
                              response?.data?.question.answers[index].id,
                              playerList?.data?.players[(player.currentPlayer + 1) % player.totalPlayer].id,
                              null,
                            );
                            log("Grid Result: $result");
                            await Utils.advanceTurnAlternate(context, ref);
                          }
                          else {
                            log("Please Select a Player");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please Select a Player"),
                              ),
                            );
                          }
                        } else {
                          log(
                            "Selected Player ID: ${playerList?.data?.players[selectedPointBlock].id}",
                          );
                          final result = await AnswerQuestionService().answer(
                            response?.data?.question.id,
                            response?.data?.question.answers[index].id,
                            playerList?.data?.players[selectedPointBlock].id,
                            null,
                          );

                          ref.read(huntModeOn.notifier).state = false;
                          await Utils.advanceTurnAlternate(context, ref);
                        }
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isPortrait ? 12.r : 26.4.r,
                      ),
                      gradient: LinearGradient(
                        colors:
                            (checkChoice == 1)
                                ? [
                                  AppColorScheme.startGradGreen,
                                  AppColorScheme.midGradGreen,
                                  AppColorScheme.hardGradGreen,
                                ]
                                : (checkChoice == 0)
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
                              (checkChoice == 1)
                                  ? AppColorScheme.rightOptionBorderColor
                                  : (checkChoice == 0)
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
