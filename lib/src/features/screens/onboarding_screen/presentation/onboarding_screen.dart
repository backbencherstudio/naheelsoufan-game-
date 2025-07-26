import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/common_widegts/create_screen/create_screen.dart';

import '../../../../core/theme/theme_extension/color_scheme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: CreateScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 298.h),
              Image.asset(AppImages.logo),
              SizedBox(height: 20.h),
              Text(
                'Trivia Game',
                style: style.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.optionBg,
                ),
              ),
              SizedBox(height: 171.h),
              Text(
                'Developed by',
                style: style.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.newText,
                ),
              ),
              Spacer(),
              Image.asset(AppImages.developedBy),
            ],
          ),
        ),
      ),
    );
  }
}
