import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/clicked_setting_widgets/clicked_setting_body.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/clicked_setting_widgets/clicked_setting_bottom.dart';

class ClickedSettingScreen extends StatelessWidget {
  const ClickedSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(child: Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.backSvg),
            ],
          ),
          SizedBox(height: 95.h,),
          ClickedSettingBody(),
          SizedBox(height: 28.5.h,),
          ClickedSettingBottom()
        ],
      ),
    ));
  }
}
