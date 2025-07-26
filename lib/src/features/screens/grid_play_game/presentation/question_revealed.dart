import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/presentation/widget/platoon_hunter_card.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/point.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/padding.dart';
import '../../game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import '../../game_type/game_type.dart';
import '../../main_quiz_screen/presentation/widgets/custom_countdown.dart';
import '../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/show_quit_dialog.dart';
import '../../main_quiz_screen/presentation/widgets/quiz_show_menu_dialog/widgets/times_up.dart';

class QuestionRevealed extends StatelessWidget {
  const QuestionRevealed({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return CreateScreen(child: Padding(padding: AppPadding.horizontalPadding,
    child: Column(
      children: [
        SizedBox(height: isPortrait ? 30.h : 13.5.w,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(!isPortrait) SizedBox(
              width: 990.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconsButtons(
                    icon: AppIcons.crossIcon,
                    onTap: () {
                      onQuitGameTap(context);
                    },
                    bgIcon: AppIcons.redBGsqare,
                  ),
                  PointShow(),
                  GestureDetector(
                      onTap: ()=> timesUp(context),
                      child: CustomCountdown()),
                ],
              ),
            ),
            if(isPortrait) CustomIconsButtons(
              icon: AppIcons.crossIcon,
              onTap: () {
                onQuitGameTap(context);
              },
              bgIcon: AppIcons.redBGsqare,
            ),
            if(isPortrait) GestureDetector(
                onTap: ()=> timesUp(context),
                child: CustomCountdown()),
            CustomIconsButtons(
              icon: AppIcons.threeDot,
              onTap: () {
                // botttom sheet jabe
              },
              bgIcon: AppIcons.iconBG,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        //point container
        if(isPortrait) PointShow(),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isPortrait ? 0.h : 300.h),
          child: GameType.multipleChoiceQuestion(
            choices: ["Chemical energy", "Sonic energy", "Thermal energy", "Nuclear energy"],
            question: "What kind of energy does that sun create?",
            rightChoice: 3
          ),
        ),
        SizedBox(height: 90.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatoonHunterCard(cardName: "Platoon",),
            SizedBox(width: isPortrait ? 24.w : 52.8.h,),
            PlatoonHunterCard(cardName: "Hunt", )
          ],
        ),
      ],
    ),)
    );
  }
}
