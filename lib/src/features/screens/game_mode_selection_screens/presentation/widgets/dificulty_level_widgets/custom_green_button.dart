import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomGreenButton extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  const CustomGreenButton({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 229.w,
        decoration: BoxDecoration(
          color: AppColorScheme.customGreenBT,
          borderRadius: BorderRadius.circular(8.r),

          boxShadow: [
            BoxShadow(
              color: AppColorScheme.softGradGreen.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              title ?? "Start",
              style: style.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
