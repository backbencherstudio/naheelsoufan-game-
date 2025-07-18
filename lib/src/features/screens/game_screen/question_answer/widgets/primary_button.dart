import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? textSize;
  final Color? color;
  final Padding? btnPadding;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.textSize,
    this.color,
    this.btnPadding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 166.w,
        height: height ?? 53.h,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1D5128),
                    Color(0xFF14BA37),
                    Color(0xFF1D5128),
                  ],
                  stops: [0.0, 0.4904, 1.0],
                )
              : null,
          color: isSelected ? color : Color(0xffFFD8EE),
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border(bottom: BorderSide(color: Color(0xff80FC95), width: 3))
              : Border(bottom: BorderSide(color: Color(0xff2E1126), width: 3)),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isSelected ? Colors.white : Color(0xff2E1126),
              fontWeight: FontWeight.w500,
              fontSize: textSize ?? 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
