import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/presentation/widget/platoon_hunter_card.dart';
import 'package:naheelsoufan_game/src/data/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/question_answer/presentation/widget/point.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../../../data/riverpod/player_game/player_game_controller.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../game_mode_selection_screens/riverpod/mode_controller.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/header_button.dart';
import '../../../quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../../game_type/game_type.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/wrong_answer_dialog.dart';
import '../../../quick_play_offline/question_answer/provider/advance_turn_controller.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/custom_countdown.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/show_quit_dialog.dart';

class QuestionRevealed extends ConsumerStatefulWidget {
  const QuestionRevealed({super.key});

  @override
  ConsumerState<QuestionRevealed> createState() => _QuestionRevealedState();
}

class _QuestionRevealedState extends ConsumerState<QuestionRevealed> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final huntMode = ref.watch(huntModeOn);
    final gameMode = ref.watch(modeProvider);
    final response = ref.watch(questionResponseProvider);
    final fileUrl = response?.data?.question.fileUrl ?? "null";

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: isPortrait ? 30.h : 13.5.w),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        SizedBox(
                          height: isPortrait ? 100.h : null,
                          width: isPortrait ? 100.h : 990.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconsButtons(
                                icon: AppIcons.crossIcon,
                                onTap: () {
                                  onQuitGameTap(context, ref);
                                },
                                bgIcon: AppIcons.redBGsqare,
                              ),
                              PointShow(),
                              SizedBox(
                                height: 20.w,
                                width: 45.w,
                                child: CustomCountdown(
                                  initTime: response?.data?.question.timeLimit ?? 60,
                                  // CHANGE
                                  onPaused: () {
                                    //(huntMode) ?
                                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                                      if (!huntMode) {
                                        /// Skip Here
                                        await AnswerQuestionService().skipAnswer(
                                          response?.data?.question.id,
                                          response?.data?.currentPlayer.id,
                                        );

                                        onWrongAnswerTap(
                                          context,
                                          response?.data?.question.correctAnswer.text ?? "",
                                          ref,
                                        );
                                        ref.read(huntModeOn.notifier).state = true;
                                        ref
                                            .read(
                                          autoCounterProvider(
                                            response?.data?.question.timeLimit ?? 60,
                                          ).notifier,
                                        )
                                            .reset();
                                      } else {
                                        await AnswerQuestionService().skipAnswer(
                                          response?.data?.question.id,
                                          null,
                                        );
                                        await Utils.advanceTurnAlternate(context, ref);
                                      }
                                    });
                                  },
                                  // CHANGE
                                ),
                              ),
                            ],
                          ),
                        ),

                      if(!isPortrait && ref.read(huntModeOn.notifier).state) HeaderButton(
                        height: isPortrait ? 40.h : 20.w,
                        textTitle: 'Steal Point',
                        borderColor: Color(0xffFFB4AB),
                        borderWidth: 3,
                        borderRadius: BorderRadius.circular(isPortrait ? 8.r : 20.r),
                        textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffFFDAD6),
                          fontWeight: FontWeight.w500,
                          fontSize: isPortrait ? 18.sp : 8.sp,
                        ),

                        gradientColor: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFF5449),
                            Color(0xFFFF5449),
                            Color(0xFFFF5449),
                          ],
                          stops: [0.0, 0.4904, 1.0],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isPortrait ? 12.w : 26.4.h,
                          vertical: isPortrait ? 4.h : 3.6.w,
                        ),
                      ),
                      CustomPopUpMenu(),
                    ],
                  ),
              SizedBox(height: 16.h),
              //point container
              if (isPortrait) PointShow(),
              SizedBox(height: 16.h),

              if (response?.data?.question.questionType.name != null &&
                  response?.data?.question.questionType.name == "Text") ...[
                if (fileUrl.contains(".png") ||
                    fileUrl.contains(".jpg") ||
                    fileUrl.contains(".jpeg") ||
                    fileUrl.contains(".webp")) ...[
                  GameType.typedQuestionWithImage(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    answer: response?.data?.question.correctAnswer.text ?? "",
                    image: fileUrl,
                  ),
                ] else if (fileUrl.contains(".mp4") ||
                    fileUrl.contains(".mov") ||
                    fileUrl.contains(".webm") ||
                    fileUrl.contains(".mkv")) ...[
                  GameType.typedQuestionWithVideo(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    thumbnail:
                    "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                    video: fileUrl,
                    answer: response?.data?.question.correctAnswer.text ?? "",
                  ),
                ] else if (fileUrl.contains(".mp3") ||
                    fileUrl.contains(".wav") ||
                    fileUrl.contains(".m4a") ||
                    fileUrl.contains(".aac")) ...[
                  GameType.typedQuestionWithAudio(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    answer: response?.data?.question.correctAnswer.text ?? "",
                    audio: fileUrl,
                  ),
                ] else ...[
                  GameType.typedQuestion(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    answer: response?.data?.question.correctAnswer.text ?? "",
                  ),
                ],
              ] else ...[
                if (fileUrl.contains(".png") ||
                    fileUrl.contains(".jpg") ||
                    fileUrl.contains(".jpeg") ||
                    fileUrl.contains(".webp")) ...[
                  GameType.mcqQuestionWithImage(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    choices:
                    response?.data?.question.answers
                        .map((e) => e.text)
                        .toList() ??
                        [],
                    imageUrl: fileUrl,
                    rightChoice: response?.data?.question.answers.indexWhere(
                          (e) => e.id == response.data?.question.correctAnswer.id,
                    ),
                  ),
                ] else if (fileUrl.contains(".mp4") ||
                    fileUrl.contains(".mov") ||
                    fileUrl.contains(".webm") ||
                    fileUrl.contains(".mkv")) ...[
                  GameType.mcqQuestionWithVideo(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    choices:
                    response?.data?.question.answers
                        .map((e) => e.text)
                        .toList() ??
                        [],
                    rightChoice: response?.data?.question.answers.indexWhere(
                          (e) => e.id == response.data?.question.correctAnswer.id,
                    ),
                    videoUrl: fileUrl,
                    videoThumbnailUrl:
                    "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                  ),
                ] else if (fileUrl.contains(".mp3") ||
                    fileUrl.contains(".wav") ||
                    fileUrl.contains(".m4a") ||
                    fileUrl.contains(".aac")) ...[
                  GameType.mcqQuestionWithAudio(
                    question:
                    response?.data?.question.text ?? "No Question found",
                    rightChoice: response?.data?.question.answers.indexWhere(
                          (e) => e.id == response.data?.question.correctAnswer.id,
                    ),
                    choices:
                    response?.data?.question.answers
                        .map((e) => e.text)
                        .toList() ??
                        [],
                    audioUrl: fileUrl,
                  ),
                ] else ...[
                  GameType.multipleChoiceQuestion(
                    rightChoice: response?.data?.question.answers.indexWhere(
                          (e) => e.id == response.data?.question.correctAnswer.id,
                    ),
                    choices:
                    response?.data?.question.answers
                        .map((e) => e.text)
                        .toList() ??
                        [],
                    question:
                    response?.data?.question.text ?? "No Question found",
                  ),
                ],
              ],

              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: isPortrait ? 0.h : 300.h,
              //   ),
              //   child: GameType.imageMcqQuestion(
              //       choicesImageURL: [
              //         'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
              //         'https://www.worldanimalprotection.org/cdn-cgi/image/width=1920,format=auto/globalassets/images/elephants/1033551-elephant.jpg',
              //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOG5TM1EovYcHRS_Uoi7lufuMrQ3slzfmoLg&s',
              //         'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
              //       ],
              //       question: 'Which one is Horse? Select correct one from image below?',
              //       rightChoice: 2),
              // ),
              SizedBox(height: isPortrait ? 100.h : 15.w),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    if (!huntMode) ...[
                        (ref.read(isRightWrongElse.notifier).state == -1) ?
                          PlatoonHunterCard(cardName: "Platoon", index: 1) :
                          (ref.read(isRightWrongElse.notifier).state == 1) ?
                          PlatoonHunterCard(cardName: "100 Pts", index: 3) :
                        PlatoonHunterCard(cardName: "Platoon", index: 1),
                        SizedBox(width: isPortrait ? 24.w : 52.8.h),
                        PlatoonHunterCard(cardName: "Hunt", index: 0)
                      ]
                      else ...[
                        PlatoonHunterCard(cardName: "Platoon", index: 2),
                        SizedBox(width: isPortrait ? 24.w : 52.8.h),
                        if (ref.read(isRightWrongElse.notifier).state == -1) ...[
                          PlatoonHunterCard(cardName: "Hunt", index: 1),
                        ] else if (ref.read(isRightWrongElse.notifier).state == 1) ...[
                          GestureDetector(
                              onTap: ()async{
                                await Future.delayed(const Duration(seconds: 1));
                                if (!context.mounted) return;
                                context.push(RouteName.splashScreen);
                              },
                              child: PlatoonHunterCard(cardName: "150 Pts", index: 3)),
                        ] else ...[
                          PlatoonHunterCard(cardName: "Hunt", index: 1),
                        ],
                    ],
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
