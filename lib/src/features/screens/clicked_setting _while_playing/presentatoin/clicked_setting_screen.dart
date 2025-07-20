import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/constant/padding.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';
import 'package:naheelsoufan_game/src/features/screens/clicked_setting%20_while_playing/presentatoin/widget/clicked_setting_body.dart';

class ClickedSettingScreen extends StatelessWidget {
  const ClickedSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateScreen(child: Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        children: [
          ClickedSettingBody()
        ],
      ),
    ));
  }
}
