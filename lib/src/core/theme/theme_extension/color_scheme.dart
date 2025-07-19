import 'package:flutter/material.dart';

class AppColorScheme {
  static const Color screenBackground = Color(0xFF101010);
  static const Color primary = Color(0xFFE0E0FF);
  static const Color onPrimary = Color(0xffFFFFFF);
  static const Color secondary = Color(0xFF3D4279);
  static const Color onSecondary = Colors.white;
  static const Color onError = Color(0xFFD7CCC8);
  static const Color error = Color(0xFFF75555);
  static const Color surface = Color(0xFF1D5128);
  static const Color onSurface = Color(0xFF008A39);
  static const Color primaryTextColor = Color(0xff6B71B9);
  static const Color secondaryTextColor = Color(0xffE0E0E0);
  static const Color labelTextColor = Color(0xff2E1126);
  static const Color borderColor = Color(0xffE0E0FF);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.10);
  static const Color dividerColor = Color(0xff35383F);
  static const Color cardBgColor = Color(0xff1A1A1A);
  static const Color tileTextColor = Color(0xffA5A5AB);

  static const Color softYellow = Color(0xffF2E792);
  static const Color midYellow = Color(0xffF8B133);
  static const Color darkYellow = Color(0xffDE712B);

  static const Color softGradGreen = Color(0xffB8F1B9);

  static const Color startGradGreen = Color(0xff1D5128);
  static const Color midGradGreen = Color(0xff14BA37);
  static const Color hardGradGreen = Color(0xff1D5128);

  static const Color containerColor = Color(0xff555A92);
  static const Color yellowborder = Color(0xffF2E792);
  static const Color greenborder = Color(0xffB8F1B9);
  static const Color greenTextColor = Color(0xffB8F1B9);
  static const Color purpleContainerColor = Color(0xff52589F);
  static const Color deepPuroleBG = Color(0xff3D4279);

  static const Color lightButtonborder = Color(0xffFFB4AB);
  static const Color darkpurpleborder = Color(0xff00024C);
  static const Color customGreenBT = Color(0xff008A39);
  static const Color greenery = Color(0xff63DF7C);
  static const Color listContainerColor = Color(0xffE0E0FF);
  // static const Color  = ;

  // static const Color  customGreenBT = Color(0xff008A39);
  // static const Color  greenery = Color(0xff63DF7C);
   static const Color   socialBack = Color(0xFF9FA5F2);
  // static const Color  = ;
  // static const Color  = ;
  // static const Color  = ;
  // static const Color  = ;
  // static const Color  = ;
  // static const Color  = ;
  // static const Color  = ;

  static ColorScheme colorScheme = ColorScheme.light(
    primary: primary,
    secondary: secondary,
    surface: surface,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    error: error,
    onError: onError,
    brightness: Brightness.light,
    errorContainer: error,
  );
}
