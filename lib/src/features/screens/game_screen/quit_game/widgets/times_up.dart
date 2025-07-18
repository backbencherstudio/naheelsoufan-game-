import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../question_answer/presentation/question_answers_screen.dart';

void timesUp(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClockWidgets(text: '60', color: Color(0xffDE3730)),
              SizedBox(height: 24.h),
              Text(
                'Times Up!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Color(0xffFFDAD6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                'Other players will got the chance to steal the point',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xffE0E0FF),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
