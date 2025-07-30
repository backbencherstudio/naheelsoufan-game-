import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

class AppTextTheme {
  static double orientationAwareFontSize(BuildContext context, double size) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final baseDimension = isPortrait ? mediaQuery.size.width : mediaQuery.size.height;
    return size * baseDimension / 430;
  }

  static TextTheme darkTextTheme(BuildContext context) {
    return TextTheme(
      /// display -- auth flow
      displayLarge: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 24.0),
        fontWeight: FontWeight.w500,
        color: AppColorScheme.primary,
      ),
      displayMedium: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 14.0),
        fontWeight: FontWeight.w500,
        color: AppColorScheme.primary,
      ),
      displaySmall: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 14.0),
        fontWeight: FontWeight.w400,
        color: AppColorScheme.primary,
      ),

      /// headline
      headlineLarge: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 32.0),
        fontWeight: FontWeight.w600,
        color: AppColorScheme.onPrimary,
      ),
      headlineMedium: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 28.0),
        fontWeight: FontWeight.w600,
        color: AppColorScheme.onPrimary,
      ),
      headlineSmall: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 24.0),
        fontWeight: FontWeight.w700,
        color: AppColorScheme.onPrimary,
      ),

      /// title
      titleLarge: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 24.0),
        fontWeight: FontWeight.w600,
        color: AppColorScheme.onPrimary,
      ),
      titleMedium: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 22.0),
        fontWeight: FontWeight.w600,
        color: AppColorScheme.onPrimary,
      ),
      titleSmall: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 20.0),
        fontWeight: FontWeight.w500,
        color: AppColorScheme.onPrimary,
      ),

      /// body
      bodyLarge: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 16.0),
        fontWeight: FontWeight.normal,
        color: AppColorScheme.onPrimary,
      ),
      bodyMedium: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 14.0),
        fontWeight: FontWeight.normal,
        color: AppColorScheme.onPrimary,
      ),
      bodySmall: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 12.0),
        fontWeight: FontWeight.normal,
        color: AppColorScheme.onPrimary,
      ),

      /// label
      labelLarge: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 14.0),
        fontWeight: FontWeight.w400,
        color: AppColorScheme.labelTextColor,
      ),
      labelMedium: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 12.0),
        fontWeight: FontWeight.w400,
        color: AppColorScheme.labelTextColor,
      ),
      labelSmall: GoogleFonts.robotoFlex(
        fontSize: orientationAwareFontSize(context, 10.0),
        fontWeight: FontWeight.w400,
        color: AppColorScheme.labelTextColor,
      ),
    );
  }
}
