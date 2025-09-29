import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../auth/register/presentation/widget/custom_textformfield.dart';
import '../../../grid_play_game/riverpod/function.dart';
import '../../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../mcq_question/widget/image_part.dart';
import '../mcq_question/widget/video_part.dart';

class TypedQuestionWithImageVideo extends ConsumerStatefulWidget {
  final String question;
  final String? imageUrl;
  final String? videoUrl;
  final String? videoThumbnailUrl;
  final String? rightAnswer;

  const TypedQuestionWithImageVideo({
    super.key,
    required this.question,
    this.imageUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.rightAnswer,
  });

  @override
  ConsumerState<TypedQuestionWithImageVideo> createState() => _TypedQuestionWithImageVideoState();
}

class _TypedQuestionWithImageVideoState extends ConsumerState<TypedQuestionWithImageVideo> {

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
        if (widget.videoUrl != null) VideoPart(thumbnailUrl: widget.videoThumbnailUrl, videoUrl: widget.videoUrl!),
        SizedBox(height: 17.h,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answer', style: textTheme.bodyLarge),
            SizedBox(height: 4.h),
            CustomTextFormField(
              hintText: "Type your answer here",
              controller: _answerController,
              onSubmitted: (value) {
                if (value.toLowerCase() == rightAnswer.toLowerCase()) {
                  ref.read(advanceTurnFlagProvider.notifier).state = true;
                  controller.state = current.copyWith(currentPlayer: next); // CB
                }
                else{
                  ref.read(selectedPlayerIndexProvider.notifier).state = -1;
                  ref.read(huntModeOn.notifier).state = !huntMode;

                  log("\n\n\nWRONG!!!\n\n\n");
                  if(huntMode == true){
                    ref.read(advanceTurnFlagProvider.notifier).state = true;
                    controller.state = current.copyWith(currentPlayer: next);
                  } else {
                    ref.read(autoCounterProvider(60).notifier).reset();
                    onWrongAnswerTap(context, rightAnswer, ref);
                  }

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(autoCounterProvider(60).notifier).reset();
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
