import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomDifficultyLevelCard extends ConsumerWidget {
  final String difficulty;
  final String point;
  final TextStyle style;
  final bool team1Done;
  final bool team2Done;
  const CustomDifficultyLevelCard({
    super.key,
    required this.difficulty,
    required this.point,
    required this.style,
    required this.team1Done,
    required this.team2Done,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      alignment: Alignment.center,
      height: isPortrait ? 56.h : 25.2.w,
      width: isPortrait ? 114.w : 250.8.h,
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: AppColorScheme.sweetViolet),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: (team1Done && team2Done) ? [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
          ] :  [
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
            AppColorScheme.listContainerColor,
          ],
          stops: [0.0, 45.67, 100],
        ),
        borderRadius: BorderRadius.circular(26.4.r),
        //border: Border.all(width: isPortrait ? 2.w : 4.4.h, color: AppColorScheme.sweetViolet)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(team1Done && (team1Done != team2Done))...[RotatedBox(
            quarterTurns: -1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColorScheme.hardGradGreen,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.check_circle_outline, color: AppColorScheme.softGradGreen,),
                  Text("T-1", style: TextStyle(color: AppColorScheme.softGradGreen),)
                ],
              ),
            ),
          )] else ...[SizedBox()],
          RichText(
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
          if(team2Done && (team1Done != team2Done))...[RotatedBox(
            quarterTurns: -1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColorScheme.hardGradGreen,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: AppColorScheme.softGradGreen,),
                  Text("T-2", style: TextStyle(color: AppColorScheme.softGradGreen),)
                ],
              ),
            ),
          )]else ...[SizedBox()],
        ],
      ),
    );
  }
}
