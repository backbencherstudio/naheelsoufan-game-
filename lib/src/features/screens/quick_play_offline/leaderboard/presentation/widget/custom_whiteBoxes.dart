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
      padding: EdgeInsets.symmetric(vertical: 12.h),
      width: width,
      decoration: BoxDecoration(
        color: Color(0xffE0E0FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style.bodyLarge!.copyWith(
          color: AppColorScheme.labelTextColor,
        ),
      ),
    );
  }
}
