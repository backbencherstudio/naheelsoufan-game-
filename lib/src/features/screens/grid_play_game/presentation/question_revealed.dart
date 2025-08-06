import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/data/riverpod/common_disposer.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/platoon_hunter_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/point.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/wrong_answer_dialog.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/riverpod/count_down_state.dart';
import '../../account_screens/presentation/widgets/my_account_wodgets/header_button.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../../game_type/game_type.dart';
import '../../game_type/riverpod/multiple_choice_provider.dart';
import '../../main_quiz_screen/presentation/riverpod/advance_turn_controller.dart';
import '../../main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../main_quiz_screen/presentation/widgets/custom_countdown.dart';
import '../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/show_quit_dialog.dart';
import '../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/times_up.dart';
import '../../question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';

class QuestionRevealed extends ConsumerStatefulWidget {
  const QuestionRevealed({super.key});

  @override
  ConsumerState<QuestionRevealed> createState() => _QuestionRevealedState();
}

class _QuestionRevealedState extends ConsumerState<QuestionRevealed> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(autoCounterProvider(60).notifier).start();
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    ref.listen<AdvanceNavigation>(advanceNavigationProvider, (prev, next) {
      if (next == AdvanceNavigation.leaderboard) {
        context.push(RouteName.gridLeaderboard);
      } else if (next == AdvanceNavigation.nextTurn) {
        context.pushReplacement(RouteName.gridDifficultyLevelScreen);
      }
      ref
          .read(advanceNavigationProvider.notifier)
          .state =
          AdvanceNavigation.none;
      ref.read(commonProviderDisposer)();
    });

    ref.watch(advanceTurnControllerProvider);
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: isPortrait ? 30.h : 13.5.w),
              Consumer(
                builder: (_,ref,_) {
                  final huntCheck = ref.watch(huntModeOn);
                  final current = ref.read(playerProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!isPortrait)...[
                        SizedBox(
                          width: 990.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconsButtons(
                                icon: AppIcons.crossIcon,
                                onTap: () {
                                  onQuitGameTap(context);
                                },
                                bgIcon: AppIcons.redBGsqare,
                              ),
                              PointShow(),
                              SizedBox(
                                height: 20.w,
                                width: 45.w,
                                child: CustomCountdown(
                                  initTime: 60,
                                  onPaused: () {
                                    ref.read(advanceTurnTriggerProvider.notifier).state++;
                                    timesUp(context, ref);
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      ref.read(autoCounterProvider(60).notifier).reset();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),] else ...[
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
                            onPaused: () {
                              ref.read(advanceTurnTriggerProvider.notifier).state++;
                              timesUp(context, ref);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ref.read(autoCounterProvider(60).notifier).reset();
                              });
                            },
                          ),
                        ),
                      ],

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
                  );
                }
              ),
              SizedBox(height: 16.h),
              //point container
              if (isPortrait) PointShow(),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isPortrait ? 0.h : 300.h,
                ),
                child: GameType.multipleChoiceQuestion(
                  choices: [
                    "Chemical energy",
                    "Sonic energy",
                    "Thermal energy",
                    "Nuclear energy",
                  ],
                  question: "What kind of energy does that sun create?",
                  rightChoice: 3,
                  func: (){
                    ref.read(advanceTurnFlagProvider.notifier).state = true;
                  }
                ),
              ),
              SizedBox(height: isPortrait ? 100.h : 15.w),
              Consumer(
                builder: (_, ref, _) {
                  final checkRight = ref.watch(isRightWrongElse);
                  final checkHunt = ref.watch(huntModeOn);

                  // if (checkRight != 1 && checkHunt) {
                  //   WidgetsBinding.instance.addPostFrameCallback((_) {
                  //     onWrongAnswerTap(context, "Nuclear energy", ref);
                  //   });
                  // }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    if (!ref.read(huntModeOn.notifier).state) ...[
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
