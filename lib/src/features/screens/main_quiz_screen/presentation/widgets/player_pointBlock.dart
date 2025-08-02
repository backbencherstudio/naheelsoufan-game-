import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../core/constant/icons.dart';

class PlayerPointBlock extends StatelessWidget {
  final String playerName;
  final int points;
  final int? blockCardState;

  const PlayerPointBlock({
    super.key,
    required this.playerName,
    required this.points,
    this.blockCardState,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient:LinearGradient(colors: (blockCardState == 2) ? [
        AppColorScheme.softYellow,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow,
        ]:  [
          Colors.transparent,
          Colors.transparent,
          Colors.transparent,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Container(
          padding: EdgeInsets.all(12.r),
          width: 104.w,
          height: 105.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient:
            LinearGradient(
              colors: (blockCardState == 2) ? [
                AppColorScheme.softYellow,
                AppColorScheme.midYellow,
                AppColorScheme.darkYellow,
              ] : (blockCardState == -1) ? [
                Color(0xff6B71B9),
                Color(0xff6B71B9),
                Color(0xff6B71B9),
              ] : (blockCardState == 1) ? [
                AppColorScheme.hardGradGreen,
                AppColorScheme.softGradGreen,
                AppColorScheme.hardGradGreen,
              ] : (blockCardState == 0) ? [
                Color(0xff52589F),
                Color(0xff52589F),
                Color(0xff52589F),
              ] : [
                Color(0xff9FA5F2),
                Color(0xff9FA5F2),
                Color(0xff9FA5F2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: Color(0xff434686),
              width: 3.w
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.playerpoint,
                colorFilter: ColorFilter.mode((blockCardState == 2) ? Color(0xFF2E1126) : Colors.white, BlendMode.srcIn),
              ),
              SizedBox(height: 4.h),
              Text(
                playerName,
                style: style.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                  (blockCardState == 2) ? Color(0xFF2E1126) : Colors.white
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "$points point",
                style: style.labelMedium!.copyWith(
                  color: AppColorScheme.newText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
