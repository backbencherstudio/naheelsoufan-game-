import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/special_elevated_button003/special_elevated_button003.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/player_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/presentation/widget/grid_choose_category_question_tile.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../riverpod/category_provider.dart';
import '../riverpod/page_navigation_notifier.dart';

class GridChooseCategoryScreen extends ConsumerStatefulWidget {
  const GridChooseCategoryScreen({super.key});

  @override
  ConsumerState<GridChooseCategoryScreen> createState() =>
      _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends ConsumerState<GridChooseCategoryScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final checkButton = ref.watch(isSomethingClicked);
    debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    context.pop();
                  },
                ),
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomPopUpMenu(),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "player 1",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 36.h),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                onPageChanged:
                    (index) =>
                        ref.read(pageIndexProvider.notifier).setPage(index),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int pageIndex) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      childAspectRatio: (0.5),
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final selectedItem = ref.watch(
                        isCategorySelectedClicked(pageIndex * 9 + index),
                      );
                      final categoryList = ref.watch(categoryListProvider);
                      return Column(
                        children: [
                          GridChooseCategoryQuestionTile(
                            onTap: () {
                              if(categoryList.length < 6) {
                                ref
                                    .read(
                                  isCategorySelectedClicked(
                                    pageIndex * 9 + index,
                                  ).notifier,
                                )
                                    .state = !selectedItem;
                                ref.read(isSomethingClicked.notifier).state =
                                true;
                                (categoryList.contains((pageIndex * 9 + index).toString())) ?
                                ref.read(categoryListProvider.notifier).state.remove((pageIndex * 9 + index).toString()) :
                                ref.read(categoryListProvider.notifier).state.add((pageIndex * 9 + index).toString());
                              }
                              else {
                                if(categoryList.contains((pageIndex * 9 + index).toString())) {
                                  ref
                                      .read(
                                    isCategorySelectedClicked(
                                      pageIndex * 9 + index).notifier).state = !selectedItem;
                                  ref.read(categoryListProvider.notifier).state.remove((pageIndex * 9 + index).toString());
                                }
                              }

                              debugPrint("index: $categoryList");
                            },
                            index: pageIndex * 9 + index,
                          ),
                          Text(
                            "General\nKnowledge",
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColorScheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.playleft,
                  onTap: () {
                    ref
                        .read(pageIndexProvider.notifier)
                        .previousPage(_pageController);
                  },
                  bgIcon: AppIcons.roundIcontop,
                ),
                if (!ref.read(isSomethingClicked.notifier).state) ...[
                  SizedBox(width: 40.w),
                ] else ...[
                  SizedBox(width: 26.w),
                  SpecialElevatedButton003(
                    onTap: () {
                      if(ref.read(categoryListProvider.notifier).state.isNotEmpty) {
                        context.pushReplacement(
                        RouteName.gridDifficultyLevelScreen,
                      );
                      }
                    },
                    buttonName: "NEXT",
                  ),
                  SizedBox(width: 26.w),
                ],
                CustomroundButton(
                  icon: AppIcons.playButtn,
                  onTap: () {
                    ref
                        .read(pageIndexProvider.notifier)
                        .nextPage(_pageController, 3);
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
