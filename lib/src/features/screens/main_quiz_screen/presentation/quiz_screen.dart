import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final response = ref.watch(questionResponseProvider);

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
                    initTime: 60,
                    // CHANGE
                    onPaused: () {
                      //(huntMode) ?
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (!huntMode) {
                          onWrongAnswerTap(context, "China", ref);
                          ref.read(huntModeOn.notifier).state = true;
                          ref.read(autoCounterProvider(60).notifier).resetAndStart();
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
            Consumer(
              builder: (_, ref, __) {
                // CHANGE LOGIC
                //final checkWrong = ref.watch(isCorrectQuiz);
                final huntMode = ref.watch(huntModeOn);
                return (huntMode == true) ? StealContainer() : PointShow();
                // CHANGE LOGIC
              },
            ),
            SizedBox(height: 16.h),
            GameType.multipleChoiceQuestion(
              //response?.data.question.correctAnswer.id
              rightChoice: response?.data?.question.answers.indexWhere((e)=> e.id == response.data?.question.correctAnswer.id),
              choices: response?.data?.question.answers.map((e) => e.text).toList() ?? [],
              question: response?.data?.question.text ?? "No Question found",
            ),
            SizedBox(height: 90.h),
            PlayerPointContainer(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
