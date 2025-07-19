import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';

class RegisterBottom extends StatelessWidget {
  const RegisterBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final linkTextStyle = Theme.of(context).textTheme.bodyLarge;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Register With", style: linkTextStyle,)],
        ),
        SizedBox(height: 9.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                ),
                border: Border.all(
                  width: 2.sp,
                  color: Color(0xFF9FA5F2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: SvgPicture.asset(AppIcons.apple),
              ),
            ),
            SizedBox(width: 21.w),
            Container(
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0FF),
                borderRadius: BorderRadius.circular(16.r),
                // BorderRadius.all(
                //   Radius.circular(16.r),
                // ),
                border: Border.all(
                  width: 2.sp,
                  color: Color(0xFF9FA5F2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: SvgPicture.asset(AppIcons.google),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? ", style: linkTextStyle,),
            InkWell(
              onTap: ()=>context.go(RouteName.signInScreen),
              child: Text(
                'Sign in',
                style: linkTextStyle?.copyWith(decoration: TextDecoration.underline)
              ),
            ),
          ],
        ),
      ],
    );
  }
}
