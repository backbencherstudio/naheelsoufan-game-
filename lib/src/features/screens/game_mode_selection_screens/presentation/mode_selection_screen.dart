import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/mode_selection_widgets/custom_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/pop_up_menu/custom_pop_up_menu.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/freeExpire_provider.dart';

import '../../question_answer_screen/setting_while_in_game/widgets/language_drop_down_menu.dart';

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
                final data = ref.watch(isFreeModeOnProvider);
                final isOffline = ref.watch(isOfflineOnProvider);
                return CustomCard(
                  img: AppImages.playoffline,
                  text: 'PLAY OFFLINE',
                  onTap: () {
                    // if (data == true) {
                    //   ref.read(isOfflineOnProvider.notifier).state = true;
                    //   context.push(RouteName.choosePaymentCard);
                    // } else {
                    context.push(RouteName.addPlayerScreen);
                    // }
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (context, ref, _) {
                final data = ref.watch(isFreeModeOnProvider);
                return CustomCard(
                  img: AppImages.card,
                  text: 'CREATE ROOM',
                  secondaryImg: AppImages.primaryUpsidedown,
                  onTap: () {
                    if (data == true) {
                      context.push(RouteName.choosePaymentCard);
                    } else {
                      context.push(RouteName.freeGameScreen);
                    }
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
