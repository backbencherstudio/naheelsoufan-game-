import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme_extension/color_scheme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    
    filled: true,
    fillColor: Color(0xffE0E0FF),
    
    hintStyle: GoogleFonts.robotoFlex(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xff6B71B9),
    ),
    labelStyle: GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Color(0xff6B71B9),
    ),
    prefixIconColor: Color(0xff9FA5F2),
    suffixIconColor: Color(0xff9FA5F2),
    errorStyle: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xffFC5733),
    ),
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: Color(0xfFFFFFFF)),
    ),
    enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),

      borderSide: BorderSide(color: Color(0xffFFFFFF)),
    ),
    focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),

      borderSide: BorderSide(
        color: AppColorScheme.onPrimary
      ),
    ),
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),

      borderSide: BorderSide(color: Color(0xff4A4C56)),
    ),
  );
}
