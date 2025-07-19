import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';

class ForgotLinkBody extends StatelessWidget {
  const ForgotLinkBody({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final subTitleStyle = Theme.of(context).textTheme.displaySmall;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorScheme.deepPuroleBG,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(
          width: 2.sp,
          color: AppColorScheme.primary,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 28.w,
          right: 28.w,
          bottom: 28.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Link Sent!",
              style: titleStyle,
            ),
            SizedBox(height: 12.h),
            Text("We’ve sent the link to your you*****@****.com email", style: subTitleStyle?.copyWith(fontSize: 16.sp),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              onPressed: () {
                //LOGIC
              }, buttonName: 'Open email',
            ),
          ],
        ),
      ),
    );
  }
}
