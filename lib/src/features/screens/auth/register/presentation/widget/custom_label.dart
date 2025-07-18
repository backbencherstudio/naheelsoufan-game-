import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLabel extends StatelessWidget {
  final String labelText;

  const CustomLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFFE0E0FF),
      ),
    );
  }
}
