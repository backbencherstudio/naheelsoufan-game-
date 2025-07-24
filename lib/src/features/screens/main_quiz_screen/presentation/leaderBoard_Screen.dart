import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/catagory_selection_widgets/customRound_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/leaderBox.dart';

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
                CustomIconsButtons(
                  icon: AppIcons.backIcons,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                Text(
                  "Congratulation\n“Player Name”",
                  textAlign: TextAlign.center,
                  style: style.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {}),
              ],
            ),

            SizedBox(height: 20.h),
            Leaderbox(),
SizedBox(height: 40.h,),
                  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomroundButton(
                  icon: AppIcons.reload,
                  onTap: () {},
                  bgIcon: AppIcons.roundIcontop,
                ),
                SizedBox(width: 40.w),
                CustomroundButton(icon: AppIcons.playButtn, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
