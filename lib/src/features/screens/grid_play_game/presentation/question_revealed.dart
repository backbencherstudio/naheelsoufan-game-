import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/data/dummy/dummy_question.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconsButtons(
              icon: AppIcons.crossIcon,
              onTap: () {
                onQuitGameTap(context);
              },
              bgIcon: AppIcons.redBGsqare,
            ),

            GestureDetector(
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
        PointShow(),
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
      ],
    ),)
    );
  }
}
