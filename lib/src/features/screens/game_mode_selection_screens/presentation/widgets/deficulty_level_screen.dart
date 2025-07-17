import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_box.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_green_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/dificulty_level_widgets/custom_tap_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class DeficultyLevelScreen extends StatelessWidget {
  const DeficultyLevelScreen({super.key});

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
            SizedBox(height: 24.h),
            Text(
              "player 1",
              style: style.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: Color(0xffE0E0FF),
              ),
            ),

            SizedBox(height: 15.h),
            CustomBox(
              child: Column(
                children: [
                  Text("cat"),
                  CustomTapButton(),
                  CustomTapButton(),
                  CustomGreenButton(onTap: (){})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
