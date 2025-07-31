import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_type/game_type.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_countdown.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/player_point_container.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/point.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/show_quit_dialog.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/times_up.dart';

import '../../../../core/routes/route_name.dart';
import '../../question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final List players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];

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

                GestureDetector(
                  onTap: () => timesUp(context),
                  child: CustomCountdown(),
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
            //point container
            PointShow(),
            SizedBox(height: 16.h),

            Consumer(
              builder: (_, ref, _) {
                return GameType.multipleChoiceQuestion(
                  choices: ["India", "China", "Bangladesh", "Indonesia"],
                  question: "Which country has the highest population?",
                  func:
                      () => {
                        Future.delayed(Duration(seconds: 1), () {
                          int currentPlayerTurn = ref.read(playerTurnProvider);

                          int nextPlayerTurn = (currentPlayerTurn + 1) % 4;
                          ref.read(playerTurnProvider.notifier).state =
                              nextPlayerTurn;

                          ref.read(playerNameProvider.notifier).state =
                              players[nextPlayerTurn];

                          if (nextPlayerTurn == 0) {
                            context.push(RouteName.leaderboardScreen);
                          } else {
                            context.push(RouteName.nextTurnScreen);
                          }
                        }),
                      },
                );
              },
            ),
            SizedBox(height: 90.h),
            PlayerPointContainer(),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Question 01/ 15",
                style: style.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
