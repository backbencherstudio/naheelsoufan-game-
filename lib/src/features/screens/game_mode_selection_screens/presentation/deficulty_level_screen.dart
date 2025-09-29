import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/data/repository/game/game_mode/select_category_and_difficulty_service.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_buttons_normal.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_green_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/difficulty_selection_provider.dart';
import '../../../../data/riverpod/difficulty/difficulty_provider.dart';
import '../../../../data/riverpod/game/start_game/start_game_provider.dart';

class DifficultyLevelScreen extends ConsumerWidget {
  const DifficultyLevelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final levels = ref.watch(difficultiesStateNotifierProvider);
    final cateId = ref.watch(categoryId);
    final diffId = ref.watch(difficultyId);

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
            SizedBox(height: 24.h),
            Consumer(
              builder: (_,ref,_) {
                // final player = ref.watch(playerProvider);
                return Text(
                  // 'Player ${player.currentPlayer + 1}',
                  "",
                  style: style.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColorScheme.primary,
                  ),
                );
              }
            ),
            SizedBox(height: 25.h),
            Consumer(
              builder: (context, ref, _) {
                final selectedLevel = ref.watch(levelSelectionProvider);
                return CustomBox(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: levels?.data.length,
                        itemBuilder: (context, index) {
                          return CustomButtonsNormal(
                            isSelected: selectedLevel == index,
                            onTap: () {
                              ref.read(levelSelectionProvider.notifier).state = index;
                              ref.read(difficultyId.notifier).state = levels.data[index].id;
                              debugPrint("Selected level: ${levels.data[index].name}");
                              debugPrint("Selected level: ${levels.data[index].id}");
                            },
                            title: levels!.data[index].name,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomGreenButton(
                        onTap: () async { // todo start the game
                          final categoryAndDifficultyService = SelectCategoriesAndDifficultiesService();
                          final res = await categoryAndDifficultyService.selectCategoryAndDifficulty(cateId, diffId);
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
                                content: Text("Success to start the game"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            ref.read(questionResponseProvider.notifier).state = res;
                            context.pushReplacement(RouteName.quizScreen);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
