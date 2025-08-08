import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/dummy/question_types_data.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/custom_grid_question_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/platoon_hunter_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/function.dart';
import '../../../../core/routes/route_name.dart';
import '../../game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import '../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/show_quit_dialog.dart';

class GridDifficultyLevelScreen extends StatefulWidget {
  const GridDifficultyLevelScreen({super.key});

  @override
  State<GridDifficultyLevelScreen> createState() => _GridDifficultyLevelScreenState();
}

class _GridDifficultyLevelScreenState extends State<GridDifficultyLevelScreen> {
  @override
  void initState() {
    super.initState();
    _setLandscapeMode(); // Set orientation to landscape
  }

  // @override
  // void dispose() {
  //   _setPortraitMode(); // Reset orientation to portrait
  //   super.dispose();
  // }

  // Force landscape mode
  void _setLandscapeMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  // Reset to portrait mode
  void _setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    TextTheme textTheme = Theme.of(context).textTheme;
    return CreateScreen(
      child: Consumer(
        builder: (_, ref, _) {
          final check = ref.watch(isDifficultyVanished);
          return Column(
            children: [
              SizedBox(height: isPortrait ? 30.h : 13.5.w),
              SizedBox(
                height: isPortrait ? 300.h : 135.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconsButtons(
                      icon: AppIcons.crossIcon,
                      bgIcon: AppIcons.redButtonBG,
                      onTap: () {
                        onQuitGameTap(context);
                      },
                    ),
                    SizedBox(width: isPortrait ? 8.w : 17.6.h),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8.r),
                        itemCount: questionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Consumer(
                            builder: (_, ref, _) {
                              return CustomGridQuestionCard(
                                questionId: index.toString(),
                                questionCategory:
                                    questionList[index].questionCategory,
                                nextScreen: RouteName.questionRevealedScreen,
                              );
                            }
                          );
                        },
                        separatorBuilder:
                            (_, _) =>
                                SizedBox(width: isPortrait ? 4.w : 8.8.h),
                      ),
                    ),
                    SizedBox(width: isPortrait ? 8.w : 17.6.h),
                    CustomPopUpMenu()
                  ],
                ),
              ),
              if (!ref.read(isDifficultyVanished.notifier).state) ...[
                SizedBox(height: isPortrait ? 30.h : 13.5.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isPortrait ? 24.w : 52.8.h,
                    vertical: isPortrait ? 8.h : 3.6.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColorScheme.containerColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      width: isPortrait ? 1.w : 2.2.h,
                      color: AppColorScheme.onPrimary,
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Select difficulty level",
                      style: textTheme.displayMedium?.copyWith(
                        fontSize: 7.2.sp,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                SizedBox(height: isPortrait ? 11.h : 3.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatoonHunterCard(cardName: "Platoon"),
                    SizedBox(width: isPortrait ? 24.w : 52.8.h),
                    PlatoonHunterCard(cardName: "Hunt"),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
