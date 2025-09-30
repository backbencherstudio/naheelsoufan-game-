import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/riverpod/stateProvider.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_countdown.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/player_point_container.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/point.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/show_quit_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/row_arrangment/steal_container.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/riverpod/count_down_state.dart';
import '../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../../game_type/game_type.dart';

class QuizScreen extends ConsumerStatefulWidget {

  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {

  @override
  void initState() {
    super.initState(); // Always call super first (best practice)

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final response = ref.watch(questionResponseProvider);
      ref.read(autoCounterProvider(response?.data?.question.timeLimit ?? 60).notifier).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final response = ref.watch(questionResponseProvider);
    final fileUrl = response?.data?.question.fileUrl ?? "null";

    ref.listen<AdvanceNavigation>(advanceNavigationProvider, (prev, next) {
      if (next == AdvanceNavigation.leaderboard) {
        context.push(RouteName.leaderboardScreen);
      } else if (next == AdvanceNavigation.nextTurn) {
        context.push(RouteName.nextTurnScreen);
      }
      ref
          .read(advanceNavigationProvider.notifier)
          .state =
          AdvanceNavigation.none;
    });

    ref.watch(advanceTurnControllerProvider);
    final huntMode = ref.watch(huntModeOn);
    final controller = ref.read(playerProvider.notifier);
    final current = ref.read(playerProvider);
    final next = (current.currentPlayer + 1) % current.totalPlayer;

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.crossIcon,
                  onTap: () {
                    onQuitGameTap(context);
                  },
                  bgIcon: AppIcons.redBGsqare,
                ),
                SizedBox(
                  height: 100.h,
                  width: 100.h,
                  child: CustomCountdown(
                    initTime: response?.data?.question.timeLimit ?? 60,
                    // CHANGE
                    onPaused: () {
                      //(huntMode) ?
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (!huntMode) {
                          onWrongAnswerTap(context, "China", ref);
                          ref.read(huntModeOn.notifier).state = true;
                          ref.read(autoCounterProvider(response?.data?.question.timeLimit ?? 60).notifier).reset();
                        }
                        else {
                          controller.state = current.copyWith(currentPlayer: next);
                          ref.read(advanceTurnFlagProvider.notifier).state = true;
                        }
                      });
                    },
                    // CHANGE
                  ),
                ),
                CustomIconsButtons(
                  icon: AppIcons.threeDot,
                  onTap: () {
                    context.push(RouteName.settingWhileInGameScreen);
                  },
                  bgIcon: AppIcons.iconBG,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // point container
            (huntMode == true) ? StealContainer() : PointShow(),
            SizedBox(height: 16.h),

            if(response?.data?.question.questionType.name != null && response?.data?.question.questionType.name == "Text")
              ... [
                  if(fileUrl.contains(".png") || fileUrl.contains(".jpg") || fileUrl.contains(".jpeg") || fileUrl.contains(".webp")) ...[
                    GameType.typedQuestionWithImage(
                        question: response?.data?.question.text ?? "No Question found",
                        answer: response?.data?.question.correctAnswer.text ?? "",
                        image: ApiEndPoints.fileUrlPath(fileUrl)
                    )
                  ]
                else if(fileUrl.contains(".mp4") || fileUrl.contains(".mov") || fileUrl.contains(".webm") || fileUrl.contains(".mkv")) ...[
                      GameType.typedQuestionWithVideo(
                          question: response?.data?.question.text ?? "No Question found",
                          thumbnail: "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                          video: ApiEndPoints.fileUrlPath(fileUrl),
                          answer: response?.data?.question.correctAnswer.text ?? ""
                      )
                  ]
                else if(fileUrl.contains(".mp3") || fileUrl.contains(".wav") || fileUrl.contains(".m4a") || fileUrl.contains(".aac")) ...[
                      GameType.typedQuestionWithAudio(
                        question: response?.data?.question.text ?? "No Question found",
                        answer: response?.data?.question.correctAnswer.text ?? "",
                        audio: ApiEndPoints.fileUrlPath(fileUrl),
                      ),
                    ]
                else ...[
                    GameType.typedQuestion(
                    question: response?.data?.question.text ?? "No Question found",
                    answer: response?.data?.question.correctAnswer.text ?? "",
                    ),
                ]
              ]
            else ...[
              if(fileUrl.contains(".png") || fileUrl.contains(".jpg") || fileUrl.contains(".jpeg") || fileUrl.contains(".webp")) ...[
                GameType.mcqQuestionWithImage(
                    question: response?.data?.question.text ?? "No Question found",
                    choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                    imageUrl: ApiEndPoints.fileUrlPath(fileUrl),
                    rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                )
              ]
              else if(fileUrl.contains(".mp4") || fileUrl.contains(".mov") || fileUrl.contains(".webm") || fileUrl.contains(".mkv")) ...[
                GameType.mcqQuestionWithVideo(
                  question: response?.data?.question.text ?? "No Question found",
                  choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                  rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                  videoUrl: ApiEndPoints.fileUrlPath(fileUrl),
                  videoThumbnailUrl: "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                )
              ]
              else if(fileUrl.contains(".mp3") || fileUrl.contains(".wav") || fileUrl.contains(".m4a") || fileUrl.contains(".aac")) ...[
                  GameType.mcqQuestionWithAudio(
                    question: response?.data?.question.text ?? "No Question found",
                    rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                    choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                    audioUrl: ApiEndPoints.fileUrlPath(fileUrl),
                  ),
                ]
                else ...[
                    GameType.multipleChoiceQuestion(
                      rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                      choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                      question: response?.data?.question.text ?? "No Question found",
                    ),
                  ]
            ],
            SizedBox(height: 90.h),
            PlayerPointContainer(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
