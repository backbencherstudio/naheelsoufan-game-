import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';

class CustomGameLogoContainer extends StatelessWidget {
  const CustomGameLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      height: 150.h,
      width: 106.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xffffffff)
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 3.w, right: 3.w, top: 7.h ,bottom: 2.h),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Color(0xff2E1126)
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Text(
                    "Free",
                    style: style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2E1126)),
                  ),
                ),
              ),
            ),
          ),
        SizedBox(height: 6.h,),
      Image.asset(AppImages.rocket,
      height: 100.h,
      width: 100.w,
      ),

        ],
      ),
    );
  }
}
