import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/text_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final TextStyle? errorStyle;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final formFieldTextStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
      color: AppColorScheme.secondary
    );
    final formFieldHintTextStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
        color: AppColorScheme.primaryTextColor
    );
    return Stack(
      children: [
        Container(
          height: 51.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        TextFormField(
          validator: validator ?? (value) => null,
          controller: controller,
          obscureText: obscureText,
          style: formFieldTextStyle,
          decoration: InputDecoration(
            errorStyle: errorStyle,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            filled: true,
            fillColor: AppColorScheme.primary,
            hintText: hintText,
            hintStyle: formFieldHintTextStyle,
            suffixIcon: suffixIcon != null
                ? IconButton(onPressed: onSuffixTap, icon: suffixIcon!)
                : null,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColorScheme.primary, // Normal border color
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColorScheme.primary, // Normal border color
                width: 1.w,
              ),
            ),
            // Other borders
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColorScheme.primary, // Normal border color
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColorScheme.primary, // Focused border color
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
