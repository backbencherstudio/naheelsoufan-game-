import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/mode_controller.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../common_widegts/create_screen/create_screen.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import 'widget/header_button.dart';
import '../../add_player/presentation/widget/custom_icons_Buttons.dart';
import '../../../game_mode_selection_screens/riverpod/player_provider.dart';

class NextTurnScreen extends ConsumerWidget {
  const NextTurnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final player = ref.watch(playerProvider);
    final gameMode = ref.watch(modeProvider);
    debugPrint("\n\n\nPlayer: ${ref.read(playerProvider.notifier).state.currentPlayer}\n\n\n");

    return Scaffold(
      body: CreateScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
          CustomPopUpMenu(),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 40.h),
                      width: 385.w,
                      decoration: BoxDecoration(
                        color: AppColorScheme.deepPuroleBG,
                        border: Border.all(
                          color: AppColorScheme.listContainerColor,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(126.w, 60.h, 126.w, 48.h),
                        child: Column(
                          children: [
                            Image.asset(
                              AppIcons.profile03,
                              height: 110.h,
                              width: 110.w,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "Player ${player.currentPlayer + 1}",
                              style: style.titleLarge?.copyWith(
                                color: AppColorScheme.listContainerColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: HeaderButton(
                        textTitle: 'Next Turn',
                        textStyle: style.titleLarge?.copyWith(
                          color: AppColorScheme.labelTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                        borderColor: AppColorScheme.labelTextColor,
                        gradientColor: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                           AppColorScheme.softYellow,
                           AppColorScheme.midYellow,
                           AppColorScheme.darkYellow,
                          ],
                          stops: [0.0, 0.4904, 1.0],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Consumer(
                builder: (_,ref,_) {
                  return GestureDetector(
                    onTap: () {
                      gameMode != 3 ? context.pushReplacement(RouteName.chooseCategoryScreen) : context.pushReplacement(RouteName.gridDifficultyLevelScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 66.w,
                        vertical: 16.h,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 64.w),
                      decoration: BoxDecoration(
                        color: AppColorScheme.customGreenBT,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                          bottom: BorderSide(color: AppColorScheme.softGradGreen, width: 2.w),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'NEXT',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
