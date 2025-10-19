import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/mode_controller.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/mode_selection_widgets/custom_card.dart';
import '../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../setting_while_in_game/widgets/language_drop_down_menu.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final _menuKey = GlobalKey();

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
            SizedBox(height: 28.h),
            Image.asset(AppImages.logo, height: 52.h, width: 150.w),
            SizedBox(height: 26.h),
            Consumer(
              builder: (context, ref, _) {
                return CustomCard(
                  img: AppImages.playoffline,
                  text: 'PLAY OFFLINE',
                  onTap: () {
                    ref.read(modeProvider.notifier).state = 1;
                    context.push(RouteName.freeGameScreen);
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (context, ref, _) {
                return CustomCard(
                  img: AppImages.card,
                  text: 'CREATE ROOM',
                  secondaryImg: AppImages.primaryUpsidedown,
                  onTap: () {
                    ref.read(modeProvider.notifier).state = 2;
                    context.push(RouteName.freeGameScreen);
                  },
                );
              },
            ),
            SizedBox(height: 16.h),
            LanguageDropDown(menuKey: _menuKey),
          ],
        ),
      ),
    );
  }
}
