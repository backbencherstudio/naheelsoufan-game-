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
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/choose_difficulty/presentation/widget/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/choose_difficulty/presentation/widget/custom_buttons_normal.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/choose_difficulty/presentation/widget/custom_green_button.dart';

import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../provider/difficulty_selection_provider.dart';

class DifficultyLevelScreen extends StatelessWidget {
  const DifficultyLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final List<String> levels = ["EASY", "MEDIUM", "HARD"];

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
                final player = ref.watch(playerProvider);
                return Text(
                  'Player ${player.currentPlayer + 1}',
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
                        itemCount: levels.length,
                        itemBuilder: (context, index) {
                          return CustomButtonsNormal(
                            isSelected: selectedLevel == index,
                            onTap: () {
                              ref.read(levelSelectionProvider.notifier).state = index;
                            },
                            title: levels[index],
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomGreenButton(
                        onTap: () {
                          context.push(RouteName.quizScreen);
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
