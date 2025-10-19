import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/choose_category/presentation/widget/custom_question_type_tile.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../../data/riverpod/game/start_game/start_game_provider.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../add_player/presentation/widget/custom_icons_Buttons.dart';
import '../provider/category_provider.dart';

class CategorySelectionScreen extends ConsumerStatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  ConsumerState<CategorySelectionScreen> createState() => _CatagorySelectionScreenState();
}

class _CatagorySelectionScreenState extends ConsumerState<CategorySelectionScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
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
    final selectedState = ref.watch(selectProvider);
    final categories = ref.watch(categoryProvider);
    final currentPage = ref.watch(currentPageProvider);
    final isNotTab = Utils.isTablet(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    ref.listen<int>(currentPageProvider, (previous, next) {
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });

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
                    Navigator.pop(context);
                  },
                ),
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomPopUpMenu(),
              ],
            ),

            SizedBox(height: 36.h),

            Expanded(
              child: (categories?.data.length == null) ? Center(child: Text("No Data Found", style: style.displayLarge,),) : PageView.builder(
                  itemCount: categories?.pagination.totalPages,
                  controller: _pageController,
                  itemBuilder: (context, pageIndex) {
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
                            CustomQuestionTypeTile(
                              isSelected: selectedState == index,
                              onTap: () {
                                ref.read(selectProvider.notifier).state = index;
                                if (context.mounted) {
                                  ref.read(categoryId.notifier).state = categories?.data[index].id;
                                  debugPrint("Category ID: ${categories?.data[index].id}");
                                  context.push(RouteName.difficultyLevelScreen);
                                  ref.read(selectProvider.notifier).state = null;
                                }
                              },
                              title: categories?.data[index].name ?? "", imgUrl: ApiEndPoints.convertToS3Url(categories?.data[index].image ?? ""),
                              questionNumber: categories?.data.length ?? 0,
                            ),
                            Text(
                              categories?.data[index].name ?? "",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    );
                  }
              ),
            ),


            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.playleft,
                  onTap: () async {
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
                SizedBox(width: 40.w),
                CustomroundButton(icon: AppIcons.playButtn, onTap: () async {
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
                }),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}