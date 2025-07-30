import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomPlacebox extends StatelessWidget {
  final int place;
  const CustomPlacebox({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        SvgPicture.asset(AppIcons.profileIcons),
        SizedBox(height: isPortrait ? 4.h : 1.6.w),
        Text("Player Name", style: style.bodyLarge),
        SizedBox(height: isPortrait ? 8.h : 3.2.w),
        Container(
           padding:place==2? EdgeInsets.all(isPortrait ? 8.r : 17.6.r): EdgeInsets.symmetric(horizontal:isPortrait ? 8.w : 17.6.h, vertical: isPortrait ? 4.h : 1.6.w, ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isPortrait ? 8.r : 17.6.r),
            gradient:place ==1 ?

            LinearGradient(
              colors: [
                AppColorScheme.startGradGreen,
                AppColorScheme.midGradGreen,
                AppColorScheme.hardGradGreen,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ):




            LinearGradient(
              colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: AppColorScheme.labelTextColor, width: isPortrait ? 2.w : 4.4.h),
          ),
          child: Column(
            children: [
              if (place == 1) ...[
                Text(
                  "1st",
                  style: style.headlineSmall!.copyWith(
                    color: AppColorScheme.onPrimary,
                  ),
                ),
              ] else if (place == 2) ...[
                Text(
                  "2nd",
                  style: style.bodyLarge!.copyWith(
                    color: AppColorScheme.labelTextColor,
                  ),
                ),
              ] else if (place == 3) ...[
                Text(
                  "3rd",
                  style: style.bodyLarge!.copyWith(
                    color: AppColorScheme.labelTextColor,
                  ),
                ),
              ],

              Text(
                "650 point",
                style: style.bodyLarge!.copyWith(
                  fontSize: isPortrait ? 12.sp : 4.8.w,
                  color: AppColorScheme.scondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}