import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/widget/custom_textformfield.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../mcq_question/widget/audio_part.dart';
import '../mcq_question/widget/image_part.dart';
import '../mcq_question/widget/video_part.dart';

class TypedQuestionWithImageVideo extends ConsumerStatefulWidget {
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  final String? audioUrl;
  final String? rightAnswer;

  const TypedQuestionWithImageVideo({
    super.key,
    required this.question,
    this.imageUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.audioUrl,
    this.rightAnswer,
  });

  @override
  ConsumerState<TypedQuestionWithImageVideo> createState() =>
      _TypedQuestionWithImageVideoState();
}

class _TypedQuestionWithImageVideoState
    extends ConsumerState<TypedQuestionWithImageVideo> {
  late TextEditingController _answerController;

  @override
  void initState() {
    _answerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final rightAnswer = widget.rightAnswer ?? "";
    final controller = ref.read(playerProvider.notifier);
    final current = ref.read(playerProvider);
    final next = (current.currentPlayer + 1) % current.totalPlayer;
    final huntMode = ref.watch(huntModeOn);
    final response = ref.watch(questionResponseProvider);
    final selectedPointBlock = ref.watch(selectedPlayerIndexProvider);
    final playerList = ref.watch(playerListProvider);
    return Column(
      children: [
        Text(
          widget.question,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        ///Image part
        if (widget.imageUrl != null) ImagePart(imageUrl: widget.imageUrl),

        ///video part
        if (widget.videoUrl != null)
          VideoPart(
            thumbnailUrl: widget.videoThumbnailUrl,
            videoUrl: widget.videoUrl!,
          ),

        ///audio part
        if (widget.audioUrl != null) AudioPart(audioUrl: widget.audioUrl!),
        SizedBox(height: 17.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answer', style: textTheme.bodyLarge),
            SizedBox(height: 4.h),
            CustomTextFormField(
              hintText: "Type your answer here",
              controller: _answerController,
              onSubmitted: (value) async {
                if (value.toLowerCase() == rightAnswer.toLowerCase()) {
                  log("RIGHT!!!");

                  if(huntMode){
                    if (selectedPointBlock == -1 ||
                        selectedPointBlock == current.currentPlayer) {
                      log("Please Select a Player");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Select a Player")),
                      );
                    } else {
                      log(
                        "Selected Player ID: ${playerList?.data.players[selectedPointBlock].id}",
                      );
                      await AnswerQuestionService().answer(
                        response?.data?.question.id,
                        response?.data?.question.answers[0].id,
                        playerList?.data.players[selectedPointBlock].id,
                      );
                    }
                  }
                  // Hunt Mode ??????

                  else {
                    await AnswerQuestionService().answer(
                      response?.data?.question.id,
                      response?.data?.question.answers[0].id,
                      playerList?.data.players[current.currentPlayer].id,
                    );
                  }

                  ref.read(advanceTurnFlagProvider.notifier).state = true;
                  controller.state = current.copyWith(
                    currentPlayer: next,
                  ); // CB
                } else {

                  log("Selected Answer ID: Invalid");
                  log("Selected Answer: Invalid");

                  ref.read(selectedPlayerIndexProvider.notifier).state = -1;

                  log("\n\n\nWRONG!!!\n\n\n");
                  if (huntMode == true) {
                    if (selectedPointBlock == -1 ||
                        selectedPointBlock == current.currentPlayer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Select a Player")),
                      );
                    } else {
                      ref.read(huntModeOn.notifier).state = false;
                      await AnswerQuestionService().answer(
                        response?.data?.question.id,
                        "invalid",
                        playerList?.data.players[selectedPointBlock].id,
                      );

                      ref.read(advanceTurnFlagProvider.notifier).state = true;
                      controller.state = current.copyWith(currentPlayer: next);
                    }
                  } else {
                    await AnswerQuestionService().answer(
                      response?.data?.question.id,
                      "Invalid",
                      playerList?.data.players[current.currentPlayer].id,
                    );
                    ref
                        .read(
                          autoCounterProvider(
                            response?.data?.question.timeLimit ?? 60,
                          ).notifier,
                        )
                        .reset();
                    onWrongAnswerTap(context, rightAnswer, ref);
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
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
