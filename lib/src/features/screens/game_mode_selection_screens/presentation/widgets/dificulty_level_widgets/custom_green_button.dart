import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGreenButton extends StatelessWidget {
 final void Function()? onTap;
 final String? title;
  const CustomGreenButton({super.key,
  required this.onTap,
  this.title,
  });

  @override
  Widget build(BuildContext context) {
        final style = Theme.of(context).textTheme;

    return  GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 229.w,
                    decoration: BoxDecoration(
                      color: Color(0xff008A39),
                      borderRadius: BorderRadius.circular(8.r),

                      border: Border(
                        left: BorderSide(color: Color(0xffB8F1B9), width: 0.5.w),
                        right: BorderSide(color: Color(0xffB8F1B9), width: 0.5.w),
                        bottom: BorderSide(color: Color(0xffB8F1B9), width: 1.5.w),
                        top: BorderSide.none,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0xffB8F1B9).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Text( title??
                          "Start",
                          style: style.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                );}}