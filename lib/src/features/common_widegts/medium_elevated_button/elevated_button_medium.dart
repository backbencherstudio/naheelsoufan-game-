import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonMedium extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const CustomElevatedButtonMedium({
    super.key,
    required this.onPressed,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 229.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border(
              bottom: BorderSide(
            color: Color(0xFFB8F1B9),
            width: 3.r
          ),
              left: BorderSide(
                  color: Color(0xFFB8F1B9),
                  width: 0.5.r
              ),
          right: BorderSide(
              color: Color(0xFFB8F1B9),
            width: 0.5.r
        )),
          color: Color(0xFF008A39),

        ),
        child: Center(
            child: Text(buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            )
        ),
      ),
    );
  }
}
