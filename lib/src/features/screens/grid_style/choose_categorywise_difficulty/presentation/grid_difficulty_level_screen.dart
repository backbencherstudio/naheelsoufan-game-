import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/dummy/question_types_data.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_difficulty_title.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_question_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/platoon_hunter_card.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../../../quick_play_offline/question_answer/presentation/widget/show_quit_dialog.dart';
import '../../choose_multiple_category/riverpod/category_provider.dart';
import '../riverpod/grid_difficulty_provider.dart';

class GridDifficultyLevelScreen extends ConsumerStatefulWidget {
  const GridDifficultyLevelScreen({super.key});

  @override
  ConsumerState<GridDifficultyLevelScreen> createState() => _GridDifficultyLevelScreenState();
}

class _GridDifficultyLevelScreenState extends ConsumerState<GridDifficultyLevelScreen> {

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    TextTheme textTheme = Theme.of(context).textTheme;

    final categoryList = ref.watch(categoryListProvider);

    final difficultyClicked = ref.watch(isDifficultyVanished);

    return CreateScreen(
      child: Consumer(
        builder: (_, ref, _) {
          debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: isPortrait ? 30.h : 13.5.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconsButtons(
                      icon: AppIcons.crossIcon,
                      bgIcon: AppIcons.redButtonBG,
                      onTap: () {
                        onQuitGameTap(context);
                      },
                    ),
                    CustomPopUpMenu()
                  ],
                ),
                SizedBox(
                  height: 700.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(categoryList.length, (index)=>CustomGridDifficultyTitle(categoryName: questionList[index].questionCategory)),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: categoryList.length,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.w,
                                childAspectRatio: 2
                            ),
                            itemCount: 3 * categoryList.length,
                            itemBuilder: (context, index) {
                              return CustomGridQuestionCard(
                                  difficultyId: index.toString(),
                                  difficultyLevel: "EASY",
                                  difficultyPoint: 100,
                                  categoryId: categoryList[index % categoryList.length],
                                  index: index,
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                if (difficultyClicked) ...[
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
            ),
          );
        },
      ),
    );
  }
}
