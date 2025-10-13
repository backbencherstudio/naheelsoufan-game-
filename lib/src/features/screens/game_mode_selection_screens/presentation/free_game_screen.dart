import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/free_game_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/free_game_tile.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/see_plans_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/freeExpire_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../data/repository/game/game_mode/select_game_mode_service.dart';
import '../riverpod/mode_controller.dart';

class FreeGameScreen extends ConsumerWidget {
  const FreeGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late bool result;
    final mode = ref.watch(modeProvider);
    final modeName =
        (mode == 1)
            ? "QUICK_OFFLINE"
            : (mode == 2)
            ? "QUICK_ONLINE"
            : "GRID_STYLE";
    debugPrint("\n\nMode: $mode\n\n");
    final maxPlayer = (mode == 3) ? 2 : 4;
    return CreateScreen(
      child: Padding(
        padding: AppPadding.horizontalPadding,
        child: SingleChildScrollView(
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
                  CustomIconsButtons(
                    icon: AppIcons.settings,
                    onTap: () {
                      context.pushReplacement(RouteName.clickedSettingScreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              FreeGameTile(),
              SizedBox(height: 121.h),
              FreeGameCard(
                maxPlayer: maxPlayer,
                mode: modeName,
                gameNumber: 1,
                onTap: () async {
                  if(mode != 2){
                    final selectGameMode = SelectGameModeService();
                    result = await selectGameMode.createGame(
                      context: context,
                      gameMode: modeName,
                    );
                  } else {
                    /// QUICK ONLINE API CALL
                    result = false;
                  }
                  if (result) {
                    ref.read(checkNormalGridScreen.notifier).state = true;

                    context.pushReplacement((mode == 1) ? RouteName.addPlayerScreen : (mode == 2) ? RouteName.createRoomScreen : RouteName.enterTeamNameScreen);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Congratulations! Your first $modeName game created successfully (FREE)",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Failed to create $modeName game",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 121.h),
              InkWell(
                child: SeePlansContainer(),
                onTap: () => context.pushReplacement(RouteName.chooseSubscriptionScreen),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
