import 'package:flutter/material.dart';
import 'package:naheelsoufan_game/src/core/theme/part/app_bar_theme.dart';

import 'part/elevated_button_theme.dart';
import 'part/input_decoration_theme.dart';
import 'theme_extension/color_scheme.dart';
import 'theme_extension/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xff101010),
      textTheme: AppTextTheme.darkTextTheme(context),  // use the method from previous answer
      colorScheme: AppColorScheme.colorScheme,
      inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
      elevatedButtonTheme: AppEvaluatedButtonThemes.darkEvaluatedButtonTheme,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    );
  }
}
