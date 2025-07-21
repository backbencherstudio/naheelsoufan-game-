import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    required this.textTitle,
    this.gradientColor,
    this.borderColor,
    this.textStyle,
    this.padding, this.width, this.height, this.borderWidth, this.borderRadius,
  });

  final String textTitle;
  final Gradient? gradientColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? borderWidth;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width,
        height: height,
        padding:
        padding ??
            EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 16.h,
            ), // Default padding
        decoration: BoxDecoration(
          gradient:
          gradientColor ??
              LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1D5128),
                  Color(0xFF14BA37),
                  Color(0xFF1D5128),
                ],
                stops: [0.0, 0.4904, 1.0],
              ),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 2.5.w,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        ),
        child: Text(
          textTitle,
          style: textStyle ?? Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
