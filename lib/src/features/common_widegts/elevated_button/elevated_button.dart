import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../core/utils/utils.dart';

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
    final isNotTab = Utils.isTablet(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: isNotTab ? 58.h : 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
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
