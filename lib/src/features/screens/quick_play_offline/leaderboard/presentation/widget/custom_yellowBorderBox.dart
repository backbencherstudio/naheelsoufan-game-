import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomYellowborderbox extends StatelessWidget {

  final String title;
  final String icon;
  final bool isIconOpen;
  final double? width;

  const CustomYellowborderbox({
    super.key,
    required this.title,
    required this.icon,
    required this.isIconOpen,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
         gradient: LinearGradient(
        colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),

      ),

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            if (isIconOpen == true) ...[
              Image.asset(icon, height: 24.h, width: 24.w),
              SizedBox(width: 8.w),
            ],

            Text(
              title,
              style: style.bodyLarge!.copyWith(
                color: AppColorScheme.labelTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
