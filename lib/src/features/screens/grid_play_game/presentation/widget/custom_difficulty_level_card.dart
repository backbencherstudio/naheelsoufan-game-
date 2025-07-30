import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDifficultyLevelCard extends ConsumerWidget {
  final String difficulty;
  final String point;
  final List<Color> foregroundColor;
  final List<Color> backgroundColor;
  final TextStyle style;
  const CustomDifficultyLevelCard({
    super.key,
    required this.difficulty,
    required this.point,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.style
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: EdgeInsets.all(4.4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.4.r),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: backgroundColor,
            stops: [0.0, 45.67, 100]
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: isPortrait ? 56.h : 25.2.w,
        width: isPortrait ? 114.w : 250.8.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: foregroundColor,
            stops: [0.0, 45.67, 100],
          ),
          borderRadius: BorderRadius.circular(26.4.r),
          //border: Border.all(width: isPortrait ? 2.w : 4.4.h, color: AppColorScheme.sweetViolet)
        ),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: style,
                children: [
                  TextSpan(
                      text: "$difficulty\n"
                  ),
                  TextSpan(
                      text: "$point Pts"
                  )
                ]
            )),
      ),
    );
  }
}
