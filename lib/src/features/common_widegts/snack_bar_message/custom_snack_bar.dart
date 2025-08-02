import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message, {TextStyle? textStyle}) {
    final defaultTextStyle = textStyle ??
        TextStyle(
          color: AppColorScheme.error,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColorScheme.primary,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: defaultTextStyle,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      ),
    );
  }
}
