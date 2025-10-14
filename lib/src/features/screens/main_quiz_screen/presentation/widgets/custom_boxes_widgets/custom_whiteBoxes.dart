import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomWhiteboxes extends StatelessWidget {
  final String title;
  final String? icon;
  final bool isIconOpen;
  final double? width;
  final Color? color;
  const CustomWhiteboxes({
    super.key,
    required this.title,
    this.icon,
    this.width,
    required this.isIconOpen, this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color(0xffE0E0FF),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          if (isIconOpen == true) ...[
            Image.asset(icon ?? "", height: 24.h, width: 24.w),
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
    );
  }
}
