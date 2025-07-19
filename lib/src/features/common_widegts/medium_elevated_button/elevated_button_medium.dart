import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomElevatedButtonMedium extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const CustomElevatedButtonMedium({
    super.key,
    required this.onPressed,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 229.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border(
              bottom: BorderSide(
            color: AppColorScheme.softGradGreen,
            width: 3.r
          ),
              left: BorderSide(
                  color: AppColorScheme.softGradGreen,
                  width: 0.5.r
              ),
          right: BorderSide(
              color: AppColorScheme.softGradGreen,
            width: 0.5.r
        )),
          color: AppColorScheme.customGreenBT,

        ),
        child: Center(
            child: Text(buttonName,
              style: Theme.of(context).textTheme.titleSmall,
            )
        ),
      ),
    );
  }
}
