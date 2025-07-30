import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/leaderBoard_widgets/crownStack.dart';

class Customfisrtplace extends StatelessWidget {
  const Customfisrtplace({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Column(
      children: [
        Crownstack(),
        SizedBox(height: 4.h),
        Text("Player Name", style: style.bodyLarge),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(2.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
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
            width: 96.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
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
                  "750 point",
                  style: style.bodyLarge!.copyWith(
                    fontSize: 12.sp,
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