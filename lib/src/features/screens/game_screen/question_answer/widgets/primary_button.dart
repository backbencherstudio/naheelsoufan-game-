import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 166.w,
        height: 53.h,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1D5128),
              Color(0xFF14BA37),
              Color(0xFF1D5128),
            ],
            stops: [0.0, 0.4904, 1.0],
          )
              : null,
          color: isSelected ? null : Color(0xffFFD8EE),
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border(bottom: BorderSide(color: Color(0xff80FC95), width: 3))
              :Border(bottom: BorderSide(color: Color(0xff2E1126), width: 3)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xff2E1126),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto Flex',
            ),
          ),
        ),
      ),
    );
  }
}
