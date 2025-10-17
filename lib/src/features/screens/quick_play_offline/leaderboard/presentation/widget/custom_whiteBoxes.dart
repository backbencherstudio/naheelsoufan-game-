import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomWhiteboxes extends StatelessWidget {
  final String title;
  final String? icon;
  final bool isIconOpen;
  final double? width;
  const CustomWhiteboxes({
    super.key,
    required this.title,
    this.icon,
    this.width,
    required this.isIconOpen,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(left: 5.w),
      width: width,
      // margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Color(0xffE0E0FF),
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          bottom: BorderSide(color: AppColorScheme.labelTextColor, width: 4.w),
        ),
      ),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
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
