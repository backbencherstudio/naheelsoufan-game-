import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/mode_selection_widgets/custom_card.dart';
import 'package:naheelsoufan_game/src/features/screens/game_screen/quit_game/widgets/times_up.dart';

import '../../game_screen/quit_game/widgets/show_quit_dialog.dart';
import '../../game_screen/quit_game/widgets/wrong_answer_dialog.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(child: Padding(
        padding: AppPadding.horizontalPadding,
      child: Column(
           children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomIconsButtons(icon: AppIcons.cubeIcons, onTap: () {timesUp(context);}),
              Image.asset(AppImages.profilePic, height: 40.h, width: 40.w),
              CustomIconsButtons(icon: AppIcons.threeDot, onTap: () {
                onWrongAnswerTap(context);
              }),]),
              SizedBox(height: 28.h),
              Image.asset(AppImages.logo, height: 52.h, width: 150.w),
              SizedBox(height: 26.h,),
              CustomCard(img: AppImages.playoffline, text: 'PLAY OFFLINE',onTap: (){context.push(RouteName.freeGameScreen);},),
              SizedBox(height: 20.h),
              CustomCard(img: AppImages.card, text: 'CREATE ROOM',secondaryImg: AppImages.primaryUpsidedown,onTap: () { onQuitGameTap(context);},),
              ],
             
              
      ),
    ));
  }
}