import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoInputBox extends StatelessWidget {
  const InfoInputBox({
    super.key,
    required this.style,
    required this.labelName,
    this.hintText,

    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
  });

  final TextTheme style;
  final String labelName;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelName,
            style: style.bodyMedium?.copyWith(
              color: const Color(0xffBEC2FF),
              fontWeight: FontWeight.w500,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8.h),
                    hintText: hintText,
                    hintStyle: style.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    fillColor: Colors.transparent,
                    filled: true,
                    suffixIcon:
                        suffixIcon != null
                            ? IconButton(
                              onPressed: onSuffixTap,
                              icon: suffixIcon!,
                            )
                            : null,
                  ),
                  validator: validator,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
