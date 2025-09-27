import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/constant/padding.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/riverpod/difficulty/difficulty_provider.dart';
import '../../../../data/riverpod/game/category/category_controller.dart';
import '../../../common_widegts/create_screen/create_screen.dart';
import '../../auth/riverpod/auth_providers.dart';
import '../../question_answer_screen/setting_while_in_game/widgets/language_drop_down_menu.dart';
import '../riverpod/freeExpire_provider.dart';

class GameModeScreens extends ConsumerStatefulWidget {
  const GameModeScreens({super.key});

  @override
  _GameModeScreensState createState() => _GameModeScreensState();
}

class _GameModeScreensState extends ConsumerState<GameModeScreens> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final difficultiesState = ref.read(difficultiesStateNotifierProvider);
      if (difficultiesState == null) {
        ref.read(categoryProvider.notifier).fetchCategoryDetails();
        ref.read(difficultiesStateNotifierProvider.notifier).fetchDifficulties();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
    final menuKey = GlobalKey();
    final userData = ref.watch(authNotifierProvider);
    final difficultiesState = ref.watch(difficultiesStateNotifierProvider);

    return Scaffold(
      body: CreateScreen(
        keys: keys,
        child: userData.when(
          data: (user) {
            return Padding(
              padding: AppPadding.horizontalPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconsButtons(
                        icon: AppIcons.cubeIcons,
                        onTap: () {
                          keys.currentState?.openDrawer();
                        },
                      ),
                      SizedBox()
                    ],
                  ),
                  SizedBox(height: 200.h),
                  Image.asset(AppImages.logo, height: 104.h, width: 300.w),
                  SizedBox(height: 50.h),
                  CustomButton(
                    text: "QUICK GAME",
                    onTap: () {
                      ref.read(checkNormalGridScreen.notifier).state = true;
                      context.push(RouteName.modeSelectionScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    text: "GRID STYLE",
                    onTap: () {
                      ref.read(checkNormalGridScreen.notifier).state = false;
                      (ref.read(checkGridSubscription.notifier).state)
                          ? context.push(RouteName.choosePaymentCard)
                          : context.push(RouteName.freeGameScreen);
                    },
                    img: AppImages.primaryUpsidedown,
                  ),
                  SizedBox(height: 40.h),
                  LanguageDropDown(menuKey: menuKey),
                  // Display fetched difficulties if they exist
                  difficultiesState == null
                      ? const Center(child: CircularProgressIndicator())
                      : Text('Difficulties loaded successfully'), // Modify as needed
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, st) => Center(child: Text("Error: $err")),
        ),
      ),
    );
  }
}


