import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerBox extends StatelessWidget {
  final Widget child;
  const CustomContainerBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      child: child,
    );
  }
}