import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

class AppTextTheme {
  static final TextTheme darkTextTheme = TextTheme(
    
    ///display
    headlineLarge: GoogleFonts.robotoFlex(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    headlineMedium: GoogleFonts.robotoFlex(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    headlineSmall: GoogleFonts.robotoFlex(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w700,
      color: AppColorScheme.onPrimary,
    ),

    ///title
    titleLarge: GoogleFonts.robotoFlex(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    titleMedium: GoogleFonts.robotoFlex(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    titleSmall: GoogleFonts.robotoFlex(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),

    ///body
    bodyLarge: GoogleFonts.robotoFlex(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),
    bodyMedium: GoogleFonts.robotoFlex(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),
    bodySmall: GoogleFonts.robotoFlex(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),

    ///label
    labelLarge: GoogleFonts.robotoFlex(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.labelTextColor,
    ),
    labelMedium: GoogleFonts.robotoFlex(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.labelTextColor,
    ),
    labelSmall: GoogleFonts.robotoFlex(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.labelTextColor,
    ),
  );
}
