import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomButtonsNormal extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final String title;
  const CustomButtonsNormal({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: Container(
          padding: EdgeInsets.all(16.r),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      AppColorScheme.softYellow,
                      AppColorScheme.midYellow,
                      AppColorScheme.darkYellow,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : LinearGradient(
                    colors: [
                      AppColorScheme.deepPuroleBG,
                      AppColorScheme.deepPuroleBG,
                      AppColorScheme.deepPuroleBG,
                    ],
                  ),
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColorScheme.lightButtonborder : AppColorScheme.darkpurpleborder,
                width: 4.w,
              ),
            ),
          ),

          child: Center(
            child: Text(
              title,
              style: style.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColorScheme.screenBackground : AppColorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
