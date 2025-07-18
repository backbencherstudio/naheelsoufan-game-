import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DifficultyLevel extends StatelessWidget {
  const DifficultyLevel({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: 313.w,
        decoration: BoxDecoration(
          color: Color(0xff3D4279),
          border: Border(
            bottom: BorderSide(color: Color(0xff00024C), width: 3),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Color(0xffE0E0FF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
