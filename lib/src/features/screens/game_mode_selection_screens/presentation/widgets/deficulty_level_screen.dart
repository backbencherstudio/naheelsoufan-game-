import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_buttons_normal.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_green_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/difficulty_selection_provider.dart';

class DeficultyLevelScreen extends StatelessWidget {
  const DeficultyLevelScreen({super.key});

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
                CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {}),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              "player 1",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColorScheme.primary,
              ),
            ),

            SizedBox(height: 25.h),
            Consumer(
              
              builder: (context, ref,_) {
                final isSelected = ref.watch(levelSelectionProvider);
                return CustomBox(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CustomButtonsNormal(
                            isSelected: isSelected == index,
                            onTap: () {
                              ref.read(levelSelectionProvider.notifier).state=index;
                            },
                            title: levels[index],
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomGreenButton(onTap: () {}),
                    ],
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
