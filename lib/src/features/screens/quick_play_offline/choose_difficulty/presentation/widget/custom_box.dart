import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../common_widegts/custom_round_button/customRound_button.dart';
import 'custom_tap_button.dart';

class CustomBox extends StatelessWidget {
  final Widget child;
  const CustomBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Stack(
        children: [
          Positioned(
            top: 30.h,
            left: 0,
            right: 0,

            child: Container(
              width: 361.w,
              padding: EdgeInsets.all(2.0.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  colors: [
                    
                              AppColorScheme.softYellow,
                              AppColorScheme.midYellow,
                              AppColorScheme.darkYellow,
                  ],
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 80.h,
                  bottom: 40.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColorScheme.purpleContainerColor,
                ),
                child: child,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(child: SizedBox()),
                CustomTapButton(),
                Spacer(),
                CustomroundButton(icon: AppIcons.crossIcon,bgIcon: AppIcons.redBg, onTap: () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
