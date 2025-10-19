import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import 'crownStack.dart';

class CustomFirstPlace extends StatelessWidget {
  final String name;
  final int scores;
  const CustomFirstPlace({
    super.key,
    required this.name,
    required this.scores
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        CrownStack(),
        SizedBox(height: isPortrait ? 4.h : 1.8.w),
        Text(name, style: style.bodyLarge),
        SizedBox(height: isPortrait ? 8.h : 3.6.w),
        Container(
          padding: EdgeInsets.all(isPortrait ? 2.r : 4.4.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isPortrait ? 8.r : 17.6.r),
            gradient: LinearGradient(
              colors: [
                AppColorScheme.startGradGreen,
                AppColorScheme.midGradGreen,
                AppColorScheme.hardGradGreen,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: Container(
            width: isPortrait ? 96.w : 211.2.h,
            padding: EdgeInsets.symmetric(horizontal: isPortrait ? 8.w : 17.6.h, vertical: isPortrait ? 12.h : 5.4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isPortrait ? 8.r : 17.6.r),
              gradient: LinearGradient(
                colors: [
                  AppColorScheme.startGradGreen,
                  AppColorScheme.midGradGreen,
                  AppColorScheme.hardGradGreen,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),

            child: Column(
              children: [
                Text(
                  "1st",
                  style: style.headlineSmall!.copyWith(
                    color: AppColorScheme.onPrimary,
                  ),
                ),
                Text(
                  scores.toString(),
                  style: style.bodyLarge!.copyWith(
                    fontSize: isPortrait ? 12.sp : 5.4.sp,
                    color: AppColorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}