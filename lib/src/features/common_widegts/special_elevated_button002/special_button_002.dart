import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class SpecialButton002 extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const SpecialButton002({
    super.key,
    required this.onPressed,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 2.5.sp, color: AppColorScheme.surface),
          gradient: LinearGradient(colors: [
            AppColorScheme.surface,
            AppColorScheme.midGradGreen,
            AppColorScheme.surface,
          ])

        ),
        child: Center(
            child: Text(buttonName,
              style: Theme.of(context).textTheme.titleSmall
            )
        ),
      ),
    );
  }
}
