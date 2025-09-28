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
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/riverpod/stateProvider.dart';
import '../../../../data/riverpod/game/category/category_controller.dart';
import '../../../../data/riverpod/game/category/category_pagination_notifer.dart';
import '../../question_answer_screen/next_turn/riverpod/player_name_state_provider.dart';

class CatagorySelectionScreen extends ConsumerWidget {
  const CatagorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    // final player = ref.watch(playerProvider);
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
            SizedBox(height: 8.h),
            // Text(
            //   "Player ${player.currentPlayer + 1}",
            //   style: style.titleLarge!.copyWith(
            //     fontWeight: FontWeight.w400,
            //     color: AppColorScheme.primary,
            //   ),
            // ),
            SizedBox(height: 36.h),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  childAspectRatio: (0.5),
                ),
                itemCount: categories!.pagination.hasNextPage ?  10 : categories.data.length,
                itemBuilder: (context, index) {
                  final updatedIndex = currentPage * 10 + index;
                  return Column(
                    children: [
                      CustomQuestionTypeTile(
                        isSelected: selectedState == updatedIndex,
                        onTap: () {
                          ref.read(selectProvider.notifier).state = updatedIndex;
                            if (context.mounted) {
                              context.pushReplacement(RouteName.difficultyLevelScreen);
                              ref.read(selectProvider.notifier).state = null;
                            }
                        },
                        title: categories.data[updatedIndex].name, imgUrl: ApiEndPoints.imageUrlPath(categories.data[updatedIndex].image ?? ""),
                      ),
                      Text(
                        categories.data[updatedIndex].name,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                    categories.pagination.hasPreviousPage ? ref.read(currentPageProvider.notifier).state-- : debugPrint("No previous Page");
                  },
                  bgIcon: AppIcons.roundIcontop,
                ),
                SizedBox(width: 40.w),
                CustomroundButton(icon: AppIcons.playButtn, onTap: () {
                  categories.pagination.hasNextPage ? ref.read(currentPageProvider.notifier).state++ : debugPrint("No next Page");
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
