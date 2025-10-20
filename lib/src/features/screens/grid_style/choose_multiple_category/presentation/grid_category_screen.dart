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
import '../../../../../core/utils/utils.dart';
import '../../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../../data/riverpod/loading.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../quick_play_offline/choose_category/presentation/widget/custom_question_type_tile.dart';
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
    super.initState();
    Future.microtask(()async{
      ref.read(isLoading.notifier).state = true;
      ref.read(categoryProvider.notifier).fetchCategoryDetails(1);
      ref.read(isLoading.notifier).state = false;
    });
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final loading = ref.watch(isLoading);
    final checkButton = ref.watch(isSomethingClicked);
    final categories = ref.watch(categoryProvider);
    final currentPage = ref.watch(currentPageProvider);
    final isNotTab = Utils.isTablet(context);
    final selectedCategoryMap = ref.watch(categoryListProvider);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: loading ? SizedBox(height: 24.w, width: 24.w, child: const Center(child: CircularProgressIndicator())) : Column(
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
              child: (categories?.data.length == null) ? Center(child: Text("No Data Found", style: style.displayLarge,),) : PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories?.pagination.totalPages,
                itemBuilder: (BuildContext context, int pageIndex) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      childAspectRatio: (isNotTab || isPortrait) ? (0.4) : 1,
                    ),
                    itemCount: categories?.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // GridChooseCategoryQuestionTile(
                          //   index: pageIndex * 9 + index,
                          //   onTap: () {
                          //     if(categoryList.length < 6) {
                          //       ref
                          //           .read(
                          //         isCategorySelectedClicked(
                          //           pageIndex * 9 + index,
                          //         ).notifier,
                          //       )
                          //           .state = !selectedItem;
                          //       ref.read(isSomethingClicked.notifier).state =
                          //       true;
                          //       (categoryList.contains((pageIndex * 9 + index).toString())) ?
                          //       ref.read(categoryListProvider.notifier).state.remove((pageIndex * 9 + index).toString()) :
                          //       ref.read(categoryListProvider.notifier).state.add((pageIndex * 9 + index).toString());
                          //     }
                          //     else {
                          //       if(categoryList.contains((pageIndex * 9 + index).toString())) {
                          //         ref
                          //             .read(
                          //           isCategorySelectedClicked(
                          //             pageIndex * 9 + index).notifier).state = !selectedItem;
                          //         ref.read(categoryListProvider.notifier).state.remove((pageIndex * 9 + index).toString());
                          //       }
                          //     }
                          //
                          //     debugPrint("index: $categoryList");
                          //   },
                          // ),

                          CustomQuestionTypeTile(
                            isSelected: selectedCategoryMap.containsKey(categories?.data[index].id),
                            onTap: () {
                              ref.read(categoryListProvider.notifier).state[categories?.data[index].id] = categories?.data[index].name;
                              debugPrint("\n\n\nCategory ID: ${categories?.data[index].id}\n\n\n");
                              Future.delayed(Duration(microseconds: 1000), (){
                                if (context.mounted) {
                                  context.push(RouteName.difficultyLevelScreen);
                                }
                              });
                            },
                            title: categories?.data[index].name ?? "", imgUrl: categories?.data[index].image_url ?? "",
                            questionNumber: categories?.data.length ?? 0,
                          ),
                          Text(
                            categories?.data[index].name ?? "N/A",
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
                    if(categories?.pagination.hasPreviousPage ?? false) {
                      ref.read(categoryProvider.notifier).fetchCategoryDetails(currentPage - 1);
                      ref
                          .read(currentPageProvider.notifier)
                          .state--;
                      _pageController.animateToPage(
                        currentPage,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      debugPrint("No Previous Page");
                    }
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
                    if(categories?.pagination.hasNextPage ?? false) {
                      ref.read(categoryProvider.notifier).fetchCategoryDetails(currentPage + 1);
                      ref
                          .read(currentPageProvider.notifier)
                          .state++;
                      _pageController.animateToPage(
                        currentPage,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      debugPrint("No Next Page");
                    }
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
