import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/utils/utils.dart';

class CustomTapButton extends StatelessWidget {
  const CustomTapButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isNotTab = Utils.isTablet(context);
    final style = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            "Difficulty Level",
            style: style.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
