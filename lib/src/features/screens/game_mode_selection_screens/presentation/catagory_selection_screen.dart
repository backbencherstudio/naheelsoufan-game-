import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/custom_question_type_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../data/riverpod/game/start_game/start_game_provider.dart';

class CatagorySelectionScreen extends ConsumerStatefulWidget {
  const CatagorySelectionScreen({super.key});

  @override
  ConsumerState<CatagorySelectionScreen> createState() => _CatagorySelectionScreenState();
}

class _CatagorySelectionScreenState extends ConsumerState<CatagorySelectionScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(currentPageProvider));
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool didInitListener = false;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required by AutomaticKeepAliveClientMixin

    final style = Theme.of(context).textTheme;
    final selectedIndex = ref.watch(selectProvider);
    final currentPage = ref.watch(currentPageProvider);
    final categoryData = ref.read(categoryProvider);
    final isTablet = Utils.isTablet(context);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final categories = categoryData?.data ?? [];
    final totalPages = categoryData?.pagination.totalPages ?? 0;

    if (!didInitListener) {
      // Listen only once after widget is built
      ref.listen<int>(currentPageProvider, (previous, next) async {
        await _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
      didInitListener = true;
    }

    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            // Top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () => Navigator.pop(context),
                ),
                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                const CustomPopUpMenu(),
              ],
            ),
            SizedBox(height: 36.h),

            // Main content
            Expanded(
              child: categories.isEmpty
                  ? Center(child: Text("No Data Found", style: style.displayLarge))
                  : PageView.builder(
                key: ValueKey(currentPage),
                controller: _pageController,
                itemCount: totalPages,
                itemBuilder: (context, pageIndex) {
                  return GridView.builder(
                    padding: EdgeInsets.only(top: 12.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      childAspectRatio: (isTablet || isPortrait) ? 0.4 : 1.0,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Column(
                        children: [
                          CustomQuestionTypeTile(
                            isSelected: selectedIndex == index,
                            onTap: () {
                              ref.read(selectProvider.notifier).state = index;
                              final id = category.id;
                              if (id != null) {
                                ref.read(categoryId.notifier).state = id;
                                context.push(RouteName.difficultyLevelScreen);
                                ref.read(selectProvider.notifier).state = null;
                              }
                            },
                            title: category.name ?? '',
                            imgUrl: ApiEndPoints.convertToS3Url(category.image ?? ""),
                            questionNumber: categories.length,
                          ),
                          Text(
                            category.name ?? '',
                            style: style.labelLarge!.copyWith(
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

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.playleft,
                  bgIcon: AppIcons.roundIcontop,
                  onTap: () async {
                    if (categoryData?.pagination.hasPreviousPage ?? false) {
                      ref.read(currentPageProvider.notifier).state--;
                      await ref.read(categoryProvider.notifier).fetchCategoryDetails(currentPage - 1);
                    } else {
                      debugPrint("No Previous Page");
                    }
                  },
                ),
                SizedBox(width: 40.w),
                CustomroundButton(
                  icon: AppIcons.playButtn,
                  onTap: () async {
                    if (categoryData?.pagination.hasNextPage ?? false) {
                      ref.read(currentPageProvider.notifier).state++;
                      await ref.read(categoryProvider.notifier).fetchCategoryDetails(currentPage + 1);
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

  @override
  bool get wantKeepAlive => true;
}
