import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final TextStyle? errorStyle;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 51.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        TextFormField(
          validator: validator ?? (value) => null,
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.black, // Text color
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            errorStyle: errorStyle,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            filled: true,
            fillColor: Color(0xFFE0E0FF),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF6B71B9), fontSize: 14.sp),
            suffixIcon: suffixIcon != null
                ? IconButton(onPressed: onSuffixTap, icon: suffixIcon!)
                : null,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xFFE0E0FF), // Normal border color
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xFFE0E0FF), // Normal border color
                width: 1.w,
              ),
            ),
            // Other borders
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xFFE0E0FF), // Normal border color
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xFFE0E0FF), // Focused border color
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
