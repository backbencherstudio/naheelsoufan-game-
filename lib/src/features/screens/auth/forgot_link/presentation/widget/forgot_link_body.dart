import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widegts/elevated_button/elevated_button.dart';

class ForgotLinkBody extends StatelessWidget {
  const ForgotLinkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF3D4279),
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(
          width: 2.sp,
          color: Color(0xFFE0E0FF),
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
              style: TextStyle(
                fontSize: 24.sp,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 12.h),
            Text("We’ve sent the link to your you*****@****.com email", style: TextStyle(
                  fontSize: 16.sp, color: Color(0xFFFFFFFF),
            ),
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
