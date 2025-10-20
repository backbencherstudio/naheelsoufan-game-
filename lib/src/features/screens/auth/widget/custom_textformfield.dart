import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../core/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final formFieldTextStyle = Theme.of(
      context,
    ).textTheme.displaySmall?.copyWith(color: AppColorScheme.secondary);
    final formFieldHintTextStyle = Theme.of(
      context,
    ).textTheme.displaySmall?.copyWith(color: AppColorScheme.primaryTextColor);
    final errorStyle = Theme.of(
      context,
    ).textTheme.labelSmall?.copyWith(color: AppColorScheme.redGrad);
    final isNotTab = Utils.isTablet(context);
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      validator: validator ?? (value) => null,
      textInputAction: textInputAction,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: Color(0xff3D4279),
      cursorWidth: 2.w,
      style: formFieldTextStyle,
      decoration: InputDecoration(
        errorStyle: errorStyle,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        filled: true,
        fillColor: AppColorScheme.primary,
        hintText: hintText,
        hintStyle: formFieldHintTextStyle,
        suffixIcon: (suffixIcon != null) ?
        IconButton(onPressed: onSuffixTap, icon: suffixIcon ?? SizedBox()) : null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorScheme.primary,
            width: 1.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorScheme.primary,
            width: 1.w,
          ),
        ),
        // Other borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorScheme.primary,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColorScheme.primary,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
