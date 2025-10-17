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
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/choose_category/presentation/widget/custom_question_type_tile.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';
import '../provider/selection_provider.dart';

class CatagorySelectionScreen extends ConsumerWidget {
  const CatagorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final player = ref.watch(playerProvider);
    final selectedState = ref.watch(selectProvider);

    final List<String> levels = ["General Knowledge", "Math", "Science","General Knowledge", "Math", "Science","General Knowledge", "Math", "Science",];
    debugPrint("\n\n\nPlayer: ${player.currentPlayer}\n\n\n");

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
            Text(
              "Player ${player.currentPlayer + 1}",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColorScheme.primary,
              ),
            ),
            SizedBox(height: 36.h),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  childAspectRatio: (0.5),
                ),
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomQuestionTypeTile(
                        isSelected: selectedState == index,
                        onTap: () {
                          ref.read(selectProvider.notifier).state = index;
                          Future.delayed(Duration(milliseconds: 1000), () {
                            if (context.mounted) {
                              context.push(RouteName.difficultyLevelScreen);
                              ref.read(selectProvider.notifier).state = null;
                            }
                          });
                        },
                        title: levels[index],
                      ),
                      Text(
                        levels[index],
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
