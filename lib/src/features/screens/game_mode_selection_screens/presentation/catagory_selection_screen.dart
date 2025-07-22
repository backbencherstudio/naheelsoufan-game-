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
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/custom_question_type_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';

class CatagorySelectionScreen extends StatelessWidget {
  const CatagorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
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
            SizedBox(height: 8.h),
            Text(
              "player 1",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 36.h),

            Consumer(
              builder: (context, ref, _) {
                final selectedState = ref.watch(selectProvider);
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      childAspectRatio: (0.5),
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final isSelected = selectedState == index;
                      return Column(
                        children: [
                          CustomQuestionTypeTile(
                            isSelected: isSelected,
                            onTap: () {
                              debugPrint("\n\n$selectedState\n\n");
                              ref.read(selectProvider.notifier).state = index;

                           
                                Future.delayed(Duration(milliseconds: 1000), () {
                                  if (context.mounted) {
                                    context.push(
                                      RouteName.difficultyLevelScreen,
                                    );
                                  }
                                });
                              }
                    
                          ),
                          Text(
                            "General\nKnowledge",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColorScheme.primary
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.playleft,
                  onTap: () {},
                  bgIcon: AppIcons.roundIcontop,
                ),
                SizedBox(width: 40.w),
                CustomroundButton(icon: AppIcons.playButtn, onTap: () {}),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
