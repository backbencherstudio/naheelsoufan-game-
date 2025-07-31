import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialElevatedButton003 extends StatelessWidget {
  final String buttonName;
  final GestureTapCallback onTap;

  const SpecialElevatedButton003({
    super.key,
    required this.onTap,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: 229.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border(
            bottom: BorderSide(width: 3.sp,
                color: Color(0xFFB8F1B9),
          ),
        ),
          color: Color(0xFF008A39),
        ),
        child: Center(
            child: Text(buttonName,
              style: Theme.of(context).textTheme.titleSmall,
            )
        ),
      ),
    );
  }
}
