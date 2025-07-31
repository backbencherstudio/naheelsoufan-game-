import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Gradient? gradient;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;
  final EdgeInsets? padding;

  const AppCustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.gradient,
    this.borderRadius = 32,
    this.height = 56,
    this.width = 295,
    this.textColor,
    this.textSize = 16,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        // height: height!.h,
        // width: width!.w,
        decoration: BoxDecoration(
          gradient:
              gradient ??
              (color == null
                  ? LinearGradient(
                    colors: [
                      Color(0xffC84EA3),
                      Color(0xffB763BE),
                      Color(0xffB06CC9),
                      Color(0xff8F94FB),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : null),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius!.r),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: textColor ?? Color(0xff2E1126),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
