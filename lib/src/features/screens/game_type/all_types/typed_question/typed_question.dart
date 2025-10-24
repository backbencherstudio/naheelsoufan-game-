import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/notify_sound/notify_sounds.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/widget/custom_textformfield.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/function.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/wrong_answer_dialog.dart';
import '../../../quick_play_offline/question_answer/provider/toggle.dart';
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
    final huntMode = ref.watch(huntModeOn);
    final playerList = ref.watch(playerListProvider);
    final player = ref.watch(playerProvider);
    final selectedPointBlock = ref.watch(
      selectedPlayerIndexProvider,
    );
    final response = ref.watch(questionResponseProvider);
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
                if (value.toLowerCase() == widget.rightAnswer?.toLowerCase()) {
                  log("RIGHT!!!");
                  NotifySounds().playCorrectSound();

                  if(huntMode){
                    if (selectedPointBlock == -1 ||
                        selectedPointBlock == player.currentPlayer) {
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
                        response?.data?.question.answers[0].text
                      );
                    }
                  }
                  // Hunt Mode ??????

                  else {
                    await AnswerQuestionService().answer(
                      response?.data?.question.id,
                      response?.data?.question.answers[0].id,
                      playerList?.data.players[player.currentPlayer].id,
                        response?.data?.question.answers[0].text
                    );
                  }

                  await Utils.advanceTurnAlternate(context, ref);
                } else {

                  log("Selected Answer ID: Invalid");
                  log("Selected Answer: Invalid");

                  log("\n\n\nWRONG!!!\n\n\n");
                  NotifySounds().playWrongSound();
                  if (huntMode) {
                    if (selectedPointBlock == -1 ||
                        selectedPointBlock == player.currentPlayer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Select a Player")),
                      );
                    } else {
                      ref.read(huntModeOn.notifier).state = false;
                      await AnswerQuestionService().answer(
                        response?.data?.question.id,
                        "invalid",
                        playerList?.data.players[selectedPointBlock].id,
                        "invalid"
                      );

                      ref.read(selectedPlayerIndexProvider.notifier).state = -1;

                      await Utils.advanceTurnAlternate(context, ref);
                    }
                  } else {
                    await AnswerQuestionService().answer(
                      response?.data?.question.id,
                      "Invalid",
                      playerList?.data.players[player.currentPlayer].id,
                      "Invalid",
                    );
                    ref
                        .read(
                          autoCounterProvider(
                            response?.data?.question.timeLimit ?? 60,
                          ).notifier,
                        )
                        .reset();
                    onWrongAnswerTap(context, widget.rightAnswer!.toLowerCase(), ref);
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
