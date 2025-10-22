import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/data/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/provider/advance_turn_controller.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/custom_countdown.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/player_point_container.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/question_answer/presentation/widget/point.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/show_quit_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/wrong_answer_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/question_answer/presentation/widget/steal_container.dart';
import '../../../../../core/constant/api_end_points.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/repository/game/start_game/answer_question_service.dart';
import '../../../../../data/riverpod/count_down_state.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../../common_widegts/create_screen/create_screen.dart';
import '../../add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../game_type/game_type.dart';

class QuizScreen extends ConsumerStatefulWidget {

  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final huntMode = ref.watch(huntModeOn);
    final response = ref.watch(questionResponseProvider);
    final fileUrl = response?.data?.question.fileUrl ?? "null";
    final isNotTab = Utils.isTablet(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.crossIcon,
                    onTap: () {
                      onQuitGameTap(context, ref);
                    },
                    bgIcon: AppIcons.redBGsqare,
                  ),
                  SizedBox(
                    height: screenHeight*0.1,
                    child: CustomCountdown(
                      initTime: response?.data?.question.timeLimit ?? 60,
                      // CHANGE
                      onPaused: () {
                        //(huntMode) ?
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (!huntMode) {
                            /// Skip Here
                            await AnswerQuestionService().skipAnswer(response?.data?.question.id, response?.data?.currentPlayer.id);
          
                            onWrongAnswerTap(context, response?.data?.question.correctAnswer.text ?? "", ref);
                            ref.read(huntModeOn.notifier).state = true;
                            ref.read(autoCounterProvider(response?.data?.question.timeLimit ?? 60).notifier).reset();
                          }
                          else {
                            await AnswerQuestionService().skipAnswer(response?.data?.question.id, null);
                            await Utils.advanceTurnAlternate(context, ref);
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
              if(response?.data?.question.questionType.name != null && response?.data?.question.questionType.name == "Text")
                ... [
                  if(fileUrl.contains(".png") || fileUrl.contains(".jpg") || fileUrl.contains(".jpeg") || fileUrl.contains(".webp")) ...[
                    GameType.typedQuestionWithImage(
                        question: response?.data?.question.text ?? "No Question found",
                        answer: response?.data?.question.correctAnswer.text ?? "",
                        image: fileUrl
                    )
                  ]
                  else if(fileUrl.contains(".mp4") || fileUrl.contains(".mov") || fileUrl.contains(".webm") || fileUrl.contains(".mkv")) ...[
                    GameType.typedQuestionWithVideo(
                        question: response?.data?.question.text ?? "No Question found",
                        thumbnail: "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                        video: fileUrl,
                        answer: response?.data?.question.correctAnswer.text ?? ""
                    )
                  ]
                  else if(fileUrl.contains(".mp3") || fileUrl.contains(".wav") || fileUrl.contains(".m4a") || fileUrl.contains(".aac")) ...[
                      GameType.typedQuestionWithAudio(
                        question: response?.data?.question.text ?? "No Question found",
                        answer: response?.data?.question.correctAnswer.text ?? "",
                        audio: fileUrl,
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
                    imageUrl: fileUrl,
                    rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                  )
                ]
                else if(fileUrl.contains(".mp4") || fileUrl.contains(".mov") || fileUrl.contains(".webm") || fileUrl.contains(".mkv")) ...[
                  GameType.mcqQuestionWithVideo(
                    question: response?.data?.question.text ?? "No Question found",
                    choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                    rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                    videoUrl: fileUrl,
                    videoThumbnailUrl: "https://imgs.search.brave.com/leJuBumsNv6MxOtXzAlzrld294lpeiHtKd3IL7VGz9M/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAzLzIxLzM2LzUx/LzM2MF9GXzMyMTM2/NTE1Nl95a0ZqUkh2/YlFwZGt2OHZRT3Vl/NFlmcXludFpYdmxZ/ai5qcGc",
                  )
                ]
                else if(fileUrl.contains(".mp3") || fileUrl.contains(".wav") || fileUrl.contains(".m4a") || fileUrl.contains(".aac")) ...[
                    GameType.mcqQuestionWithAudio(
                      question: response?.data?.question.text ?? "No Question found",
                      rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
                      choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
                      audioUrl: fileUrl,
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
      ),
    );
  }
}
