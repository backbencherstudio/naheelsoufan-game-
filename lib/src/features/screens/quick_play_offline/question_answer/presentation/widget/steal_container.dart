import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'header_button.dart';

class StealContainer extends StatelessWidget {
  const StealContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderButton(
      textTitle: 'Steal the Point',
      gradientColor: LinearGradient(
        colors: [Color(0xffFF5449), Color(0xffFF5449)],
      ),
      borderColor: Color(0xffFFB4AB),
      borderRadius: BorderRadius.circular(12.r),
      borderWidth: 4,
      textStyle: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: Color(0xffFFDAD6)),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
    );
  }
}
