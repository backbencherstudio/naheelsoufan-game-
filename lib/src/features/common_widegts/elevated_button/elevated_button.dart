import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 2.w, color: AppColorScheme.midGradGreen.withValues(alpha: 0.2), ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.49, 1.0],
            colors: [
              AppColorScheme.hardGradGreen,
              AppColorScheme.midGradGreen,
              AppColorScheme.hardGradGreen,
            ],
          ),
        ),
        child: Center(
            child: Text(buttonName,
              style: buttonTextStyle,
            )
        ),
      ),
    );
  }
}
