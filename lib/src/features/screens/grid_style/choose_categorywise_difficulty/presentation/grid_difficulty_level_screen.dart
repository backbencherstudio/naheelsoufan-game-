import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_difficulty_title.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_categorywise_difficulty/presentation/widget/custom_grid_question_card.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/presentation/widget/platoon_hunter_card.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../data/repository/game/game_mode/select_category_and_difficulty_service.dart';
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
  ConsumerState<GridDifficultyLevelScreen> createState() =>
      _GridDifficultyLevelScreenState();
}

class _GridDifficultyLevelScreenState
    extends ConsumerState<GridDifficultyLevelScreen> {
  @override
  void initState() {
    Future.microtask(() async {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    TextTheme textTheme = Theme.of(context).textTheme;
    final categoryIdMap = ref.watch(categoryListProvider);
    final categoryNameList = categoryIdMap.values.toList();
    final categoryIdList = categoryIdMap.keys.toList();
    final difficultyClicked = ref.watch(isDifficultyVanished);
    final difficultyList = ref.watch(difficultiesStateNotifierProvider);
    final loading = ref.watch(isLoading);
    debugPrint(
      "\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n",
    );

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
                    onQuitGameTap(context, ref);
                  },
                ),
                CustomPopUpMenu(),
              ],
            ),
            SizedBox(
              height: 700.h,
              width: double.infinity,
              child:
                  loading
                      ? const CircularProgressIndicator()
                      : Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: categoryNameList.length,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 10.w,
                                    childAspectRatio:
                                        (categoryNameList.length < 2)
                                            ? 10
                                            : (categoryNameList.length < 4)
                                            ? 5
                                            : 2,
                                  ),
                              itemCount: categoryNameList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 1000,
                                  width: 1000,
                                  child: CustomGridDifficultyTitle(
                                    categoryName:
                                        categoryNameList[index] ?? "N/A",
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth,
                            height: screenHeight*0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryNameList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  //height: screenHeight*0.5,
                                  width: screenWidth / (categoryIdList.length),
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(5.r),
                                    scrollDirection: Axis.vertical,
                                    itemCount: difficultyList?.data.length ?? 0,
                                    itemBuilder: (context, index) {
                                      if (difficultyList == null || categoryNameList.isEmpty) return const SizedBox();
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: CustomGridQuestionCard(
                                          index: index,
                                          difficultyId:
                                              difficultyList.data[index].id,
                                          difficultyLevel:
                                              difficultyList.data[index].name,
                                          difficultyPoint:
                                              difficultyList.data[index].points,
                                          categoryId: categoryIdList[index] ?? "N/A",
                                          onTap: () async {
                                            final categoryAndDifficultyService = SelectCategoriesAndDifficultiesService();
                                            final res = await categoryAndDifficultyService.selectCategoryAndDifficulty(
                                                categoryIdList[index],
                                                difficultyList.data[index].id
                                            );
                                            if(res?.success == false || res == null) {
                                              debugPrint("Error: ${res?.message}");
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("No question found in this category/difficulty"),
                                                  duration: Duration(seconds: 1),
                                                ),
                                              );
                                            }
                                            else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Successfully started the game"),
                                                  duration: Duration(seconds: 1),
                                                ),
                                              );
                                              ref.read(questionResponseProvider.notifier).state = res;
                                              context.pushReplacement(RouteName.questionRevealedScreen);
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
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
                    style: textTheme.displayMedium?.copyWith(fontSize: 7.2.sp),
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
