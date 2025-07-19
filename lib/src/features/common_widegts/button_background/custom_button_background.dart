import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonBackground extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final String iconString;
  final double padding;
  const CustomButtonBackground({
    super.key,
    required this.iconString,
    required this.padding,
    required this.firstColor,
    required this.secondColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 40.w, // Adjust as needed
          height: 40.h, // Adjust as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [firstColor.withValues(alpha: 0.8), secondColor], // Two colors for the gradient
              stops: [0.5, 0.5], // Split the container in half
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: SvgPicture.asset(iconString),
          ),
        ),
      ),
    );
  }
}