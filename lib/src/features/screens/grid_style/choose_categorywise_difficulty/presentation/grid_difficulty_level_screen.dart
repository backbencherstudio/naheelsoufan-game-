import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_difficulty_title.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_question_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/presentation/widget/platoon_hunter_card.dart';
import '../../../../../data/riverpod/difficulty/difficulty_provider.dart';
import '../../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../../../data/riverpod/loading.dart';
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
  void initState() {
    Future.microtask(()async{
      ref.read(isLoading.notifier).state = true;
      ref.read(difficultiesStateNotifierProvider.notifier).fetchDifficulties();
      ref.read(isLoading.notifier).state = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    TextTheme textTheme = Theme.of(context).textTheme;
    final categoryIdMap = ref.watch(categoryListProvider);
    final categoryNameList = categoryIdMap.values.toList();
    final difficultyClicked = ref.watch(isDifficultyVanished);
    final difficultyList = ref.watch(difficultiesStateNotifierProvider);
    final cateId = ref.watch(categoryId);
    final diffId = ref.watch(difficultyId);
    final levels = ref.watch(difficultiesStateNotifierProvider);
    final loading = ref.watch(isLoading);
    debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");

    return CreateScreen(
      child: SingleChildScrollView(
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
                  child: loading ? const CircularProgressIndicator() : Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: categoryNameList.length,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.w,
                              childAspectRatio: (categoryNameList.length < 2) ? 10 : (categoryNameList.length < 4) ? 5 : 2
                            ),
                            itemCount: categoryNameList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 1000,
                                width: 1000,
                                child: CustomGridDifficultyTitle(categoryName: categoryNameList[index] ?? "N/A"),
                              );
                            }
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: categoryNameList.length,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.w,
                                childAspectRatio: (categoryNameList.length < 2) ? 10 : (categoryNameList.length < 4) ? 5 : 2
                            ),
                            itemCount: (difficultyList?.data.length ?? 1) * categoryNameList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 1000,
                                width: 1000,
                                child: CustomGridQuestionCard(
                                    difficultyId: index.toString(),
                                    difficultyLevel: "EASY",
                                    difficultyPoint: 100,
                                    categoryId: categoryIdMap[categoryNameList[index]] ?? "N/A",
                                    index: index,
                                ),
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
          ),
    );
  }
}
