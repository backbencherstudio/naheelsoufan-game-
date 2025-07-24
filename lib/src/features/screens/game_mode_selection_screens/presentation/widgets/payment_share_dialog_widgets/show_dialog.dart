import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naheelsoufan_game/src/core/routes/route_name.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/constant/images.dart';
import '../choose_subscription_widgets/app_custom_buttons.dart';


void onPaymentButton(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SingleChildScrollView(
          child: Container(
            height: 438.h,
            width: 361.w,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff2E1126), width: 2),
              gradient: LinearGradient(
                colors: [
                  Color(0xffF2E792),
                  Color(0xffF8B133),
                  Color(0xffDE712B),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h, right: 4.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          AppIcons.cancelSvg,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(AppImages.purchaseSuccess, width: 197.w, height: 175.h),
                SizedBox(height: 20.h),
                Text(
                  'Purchased Successful',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 54.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: AppCustomButton(
                    text: 'Create Room',
                    onTap: () {
                     context.push(RouteName.createRoomScreen);
                    },
                    textColor: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1D5128),
                        Color(0xff14BA37),
                        Color(0xff1D5128),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderColor: Color(0xff1D5128),
                    borderRadius: 8,
                    height: 58.h,
                    width: 304.w,
                  ),
                ),
                SizedBox(height: 42.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}
