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

    return Column(
      children: [
        SvgPicture.asset(AppIcons.profileIcons),
        SizedBox(height: 4.h),
        Text("Player Name", style: style.bodyLarge),
        SizedBox(height: 8.h),
        Container(

          padding:place==2? EdgeInsets.all(8.r): EdgeInsets.symmetric(horizontal:8, vertical: 4, ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
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
            border: Border.all(color: AppColorScheme.labelTextColor, width: 2),
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
                  fontSize: 12.sp,
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