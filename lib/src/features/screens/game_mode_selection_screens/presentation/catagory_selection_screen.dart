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
import 'package:naheelsoufan_game/src/data/repository/category/category_repository.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/custom_question_type_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/page_navigation_notifier.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../data/riverpod/game/category/category_pagination_notifer.dart';
import '../../../../data/riverpod/game/start_game/start_game_provider.dart';

class CatagorySelectionScreen extends ConsumerStatefulWidget {
  const CatagorySelectionScreen({super.key});

  @override
  ConsumerState<CatagorySelectionScreen> createState() => _CatagorySelectionScreenState();
}

class _CatagorySelectionScreenState extends ConsumerState<CatagorySelectionScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      final currentPage = ref.read(currentPageProvider);
      _pageController = PageController(initialPage: currentPage);
      ref.listen<int>(currentPageProvider, (previous, next) {
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
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
                itemBuilder: (context, pageIndex) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      childAspectRatio: (0.5),
                    ),
                    itemCount: pageIndex == (categories?.pagination.totalPages ?? 0) - 1 ? (categories?.data.length ?? 0) % 9 : 9,
                    itemBuilder: (context, index) {
                      final updatedIndex = 9*pageIndex + index;
                      return Column(
                        children: [
                          CustomQuestionTypeTile(
                            isSelected: selectedState == updatedIndex,
                            onTap: () {
                              ref.read(selectProvider.notifier).state = updatedIndex;
                                if (context.mounted) {
                                  ref.read(categoryId.notifier).state = categories?.data[updatedIndex].id;
                                  debugPrint("Category ID: ${categories?.data[updatedIndex].id}");
                                  context.push(RouteName.difficultyLevelScreen);
                                  ref.read(selectProvider.notifier).state = null;
                                }
                            },
                            title: categories?.data[updatedIndex].name ?? "", imgUrl: ApiEndPoints.convertToS3Url(categories?.data[updatedIndex].image ?? ""),
                            questionNumber: categories?.data.length,
                          ),
                          Text(
                            categories?.data[updatedIndex].name ?? "",
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
                    final page = ref.read(currentPageProvider) - 1;
                    final pageData = await CategoryRepository().fetchCategoryPageData(page);
                    if(pageData?.pagination.hasPreviousPage ?? false) {
                      ref
                          .read(currentPageProvider.notifier)
                          .state--;
                      _pageController.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 300),
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
                  final page = ref.read(currentPageProvider) + 1;
                  final pageData = await CategoryRepository().fetchCategoryPageData(page);
                  if(pageData?.pagination.hasNextPage ?? false) {
                    ref
                      .read(currentPageProvider.notifier)
                      .state++;
                    _pageController.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 300),
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
