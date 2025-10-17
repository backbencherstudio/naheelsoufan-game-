import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/constant/icons.dart';

class ClockWidgets extends StatelessWidget {
  const ClockWidgets({
    super.key, required this.text, required this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: isPortrait ? 94.h : 42.3.w,
          width: isPortrait ? 94.w : 206.3.h,
          decoration: BoxDecoration(
            color: color ?? AppColorScheme.softGradGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(isPortrait ? 100.r : 220.r),
          ),
        ),
        SvgPicture.asset(AppIcons.stopWatch),
        Positioned(
          child: Text(
            text,
            style: GoogleFonts.robotoFlex(
              fontSize: isPortrait ? 32.sp : 14.4.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}