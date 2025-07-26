import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenteredButton extends StatelessWidget {
  const CenteredButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 229.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFF80715), Color(0xFFA80710)],
          ),
          border: Border(
            bottom: BorderSide(color: Color(0xffFF5449), width: 3),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 40.w,
          ),
          child: Text(
            'Quit Game',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto Flex',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}