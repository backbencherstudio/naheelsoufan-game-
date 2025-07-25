import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomCountdown extends StatelessWidget {
  const CustomCountdown({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: isPortrait ? EdgeInsets.all(4.r) : EdgeInsets.symmetric(horizontal: 61.6.h, vertical: 1.8.w),
      decoration: BoxDecoration(
        borderRadius:isPortrait ? null: BorderRadius.all(Radius.circular(24.r)),
        shape: isPortrait ? BoxShape.circle : BoxShape.rectangle,
        color: AppColorScheme.softGradGreen.withValues(alpha: 0.2),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(AppIcons.stopWatch),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "60",
                style: style.headlineLarge!.copyWith(
                  fontSize: isPortrait ? 32.sp : 14.4.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
