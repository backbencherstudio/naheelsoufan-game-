import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSettingsTile({
  required String title,
  required String leadingIconPath,
  required String trailingIconPath,
  VoidCallback? onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffE0E0FF),
      borderRadius: BorderRadius.circular(12.r),
      border: Border(bottom: BorderSide(color: Color(0xff00024C), width: 3)),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: SvgPicture.asset(leadingIconPath, width: 24.w, height: 24.h),
      title: Text(
        title,
        style: GoogleFonts.robotoFlex(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff3D4279),
        ),
      ),
      trailing: SvgPicture.asset(trailingIconPath, width: 24.w, height: 24.h),
      onTap: onTap,
    ),
  );
}
