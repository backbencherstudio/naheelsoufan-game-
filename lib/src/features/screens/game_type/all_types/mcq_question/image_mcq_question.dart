import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/function.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/wrong_answer_dialog.dart';
import '../../../quick_play_offline/question_answer/provider/toggle.dart';
import '../../riverpod/multiple_choice_provider.dart';

class ImageMcqQuestion extends StatelessWidget {
  final List<String> choicesImageURL;
  final String question;
  final int? rightIndex;
  const ImageMcqQuestion({
    super.key,
    required this.choicesImageURL,
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
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        GridView.builder(
          itemCount: choicesImageURL.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5, // Wider buttons
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
                return InkWell(
                  onTap: () async {
                    (index == rightChoiceIndex)
                        ? ref.read(isRightWrongElse.notifier).state = 1
                        : ref.read(isRightWrongElse.notifier).state = 0;

                    for (int i = 0; i < choicesImageURL.length; i++) {
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
                      ref.read(selectedPlayerIndexProvider.notifier).state = -1;
                      ref.read(huntModeOn.notifier).state = true;

                      log("\n\n\nWRONG!!!\n\n\n");
                      if (huntMode == true) {
                        if (selectedPointBlock == -1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Select a Player"),
                            ),
                          );
                        } else {
                          log(
                            "Selected Player ID: ${playerList?.data?.players[selectedPointBlock].id}",
                          );
                          ref.read(huntModeOn.notifier).state = false;
                          final result = await AnswerQuestionService().answer(
                            response?.data?.question.id,
                            response?.data?.question.answers[index].id,
                            playerList?.data?.players[selectedPointBlock].id,
                            null,
                          );
                          //log("Hunt Result: $result");

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
                          choicesImageURL[rightChoiceIndex],
                          ref,
                        );
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
                      if (huntMode == true) {
                        if (selectedPointBlock == -1 ||
                            selectedPointBlock == player.currentPlayer) {
                          log("Please Select a Player");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Select a Player"),
                            ),
                          );
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

                      await Utils.advanceTurnAlternate(context, ref);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isPortrait ? 12.r : 26.4.r,
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
                      image: DecorationImage(
                        image: NetworkImage(choicesImageURL[index]),
                        fit: BoxFit.cover,
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
