import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialButton002 extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const SpecialButton002({
    super.key,
    required this.onPressed,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 2.5.sp, color: Color(0xFF1D5128)),
          gradient: LinearGradient(colors: [
            Color(0xFF1D5128),
            Color(0xFF14BA37),
            Color(0xFF1D5128),
          ])

        ),
        child: Center(
            child: Text(buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
              ),
            )
        ),
      ),
    );
  }
}
