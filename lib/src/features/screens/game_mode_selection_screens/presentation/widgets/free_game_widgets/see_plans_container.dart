import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeePlansContainer extends StatelessWidget {
  const SeePlansContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Color(0xffE0E0FF)
        )
      ),
      child: Text("See Plans",
      style: style.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Color(0xffE0E0FF),
            ),
      ),
    );
  }
}