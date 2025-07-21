import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class PlayerPointblock extends StatelessWidget {
  final bool isSelected;
  const PlayerPointblock({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: isSelected
            ? LinearGradient(
                colors: [
                  AppColorScheme.softYellow,
                  AppColorScheme.midYellow,
                  AppColorScheme.darkYellow,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Container(
          padding: EdgeInsets.all(12.r),
          width: 104.w,
          height: 105.h,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      AppColorScheme.softYellow,
                      AppColorScheme.midYellow,
                      AppColorScheme.darkYellow,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : LinearGradient(
                    colors: [
                      AppColorScheme.primaryTextColor,
                      AppColorScheme.primaryTextColor,
                      AppColorScheme.primaryTextColor,
                    ],
                  ),

            border: Border(
              top: BorderSide(color:isSelected? AppColorScheme.deepPuroleBG : Colors.transparent, width: 3.w),
              left: BorderSide(color:isSelected? AppColorScheme.deepPuroleBG : Colors.transparent, width: 3.w),
              right: BorderSide(color:isSelected? AppColorScheme.deepPuroleBG : Colors.transparent, width: 3.w),
              bottom: BorderSide(
               color:isSelected? AppColorScheme.deepPuroleBG : Colors.transparent, width: 3.w
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.playerpoint,
                // ignore: deprecated_member_use
                color: isSelected
                    ? AppColorScheme.screenBackground
                    : AppColorScheme.onPrimary,
              ),
              SizedBox(height: 4.h),
              Text(
                "Player 2",
                style: style.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? AppColorScheme.screenBackground
                      : AppColorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "50 point",
                style: style.labelMedium!.copyWith(
                  color: isSelected
                      ? AppColorScheme.optionBg
                      : AppColorScheme.newText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
