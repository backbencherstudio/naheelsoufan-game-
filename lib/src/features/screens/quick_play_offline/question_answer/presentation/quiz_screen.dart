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
import '../../../../../core/constant/icons.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../data/riverpod/count_down_state.dart';
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
                final huntMode = ref.watch(huntModeOn);
                return (huntMode == true) ? StealContainer() : PointShow();
              },
            ),
            SizedBox(height: 16.h),
            GameType.imageMcqQuestion(
                choicesImageURL: [
              'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
              'https://www.worldanimalprotection.org/cdn-cgi/image/width=1920,format=auto/globalassets/images/elephants/1033551-elephant.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOG5TM1EovYcHRS_Uoi7lufuMrQ3slzfmoLg&s',
              'https://cdn.britannica.com/94/494-050-A674AD3A/Fallow-deer-dama-dama.jpg',
                ],
                question: 'Which one is Horse? Select correct one from image below?',
                rightIndex: 2),
            SizedBox(height: 90.h),
            PlayerPointContainer(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
