import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/add_player/presentation/widget/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/quick_play_offline/leaderboard/presentation/widget/leaderBox.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../common_widegts/pop_up_menu/custom_pop_up_menu.dart';
import '../../../../common_widegts/custom_round_button/customRound_button.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

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
                Consumer(
                  builder: (_, ref, _) {
                    return CustomIconsButtons(
                      icon: AppIcons.backIcons,
                      onTap: () {
                        context.go(RouteName.gameModeScreens);
                      },
                    );
                  }
                ),

                Text(
                  "Congratulation\n“CHINI”",
                  textAlign: TextAlign.center,
                  style: style.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomPopUpMenu(),
              ],
            ),

            SizedBox(height: 20.h),
            Leaderbox(),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.reload,
                  onTap: () {},
                  bgIcon: AppIcons.roundIcontop,
                ),
                SizedBox(width: 40.w),
                CustomroundButton(
                    icon: AppIcons.playButtn,
                    onTap: () {}
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}