import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/mode_controller.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../question_answer_screen/setting_while_in_game/widgets/language_drop_down_menu.dart';

class GameModeScreens extends StatelessWidget {
  const GameModeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final menuKey = GlobalKey();

    return CreateScreen(
      keys: keys,

      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtons(
                  icon: AppIcons.cubeIcons,
                  onTap: () {
                    debugPrint("Drawer Tapped");
                    if (keys.currentState != null) {
                      keys.currentState?.openDrawer();
                    } else {
                      debugPrint("Scaffold keys is null");
                    }
                  },
                ),

                Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
                CustomPopUpMenu()
              ],
            ),
            SizedBox(height: 200.h),
            Image.asset(AppImages.logo, height: 104.h, width: 300.w),
            SizedBox(height: 50.h),
            Consumer(
              builder: (_, ref, _) {
                return CustomButton(
                  text: "QUICK GAME",
                  onTap: () {
                    context.push(RouteName.modeSelectionScreen);
                  },
                );
              }
            ),
            SizedBox(height: 16.h),
            Consumer(
              builder: (_, ref, _) {
                return CustomButton(
                  text: "GRID STYLE",
                  onTap: () {
                    ref.read(modeProvider.notifier).state = 3;
                    context.pushReplacement(RouteName.freeGameScreen);
                  },
                  img: AppImages.primaryUpsidedown,
                );
              }
            ),
            SizedBox(height: 40.h),
            LanguageDropDown(menuKey: menuKey,),
          ],
        ),
      ),
    );
  }
}