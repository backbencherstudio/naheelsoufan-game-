import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithBackground extends StatelessWidget {
  final String backgroundSvg;
  final String iconSvg;
  final String? lineSvg;
  final VoidCallback onTap;

  const IconButtonWithBackground({
    super.key,
    required this.backgroundSvg,
    required this.iconSvg,
    this.lineSvg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          Positioned(
            top: 0,
            bottom: 0,
            child: SvgPicture.asset(
              backgroundSvg,
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),

          // Icon in center
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: SvgPicture.asset(
                iconSvg,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),

          // Optional Line (if visible)
          if (lineSvg != null)
            Positioned(
              child: ClipOval(
                child: SvgPicture.asset(lineSvg!),
              ),
            ),
        ],
      ),
    );
  }
}
