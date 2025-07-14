import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/icons.dart';

class PlayerContainer extends StatelessWidget {
  final String name;
  final int points;
  final bool isSelected;
  final VoidCallback onTap;

  const PlayerContainer({
    super.key,
    required this.name,
    required this.points,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 104.w,
        height: 80.h,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2E792),
              Color(0xFFF8B133),
              Color(0xFFDE712B),
            ],
            stops: [0.0, 0.4904, 1.0],
          )
              : null,
          color: isSelected ? null : Color(0xff6B71B9),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border(bottom: BorderSide(color: Color(0xffFFD8EE), width: 4))
              : Border(bottom: BorderSide(color: Color(0xff52589F), width: 4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SvgPicture.asset(AppIcons.profileSvg, width: 24.w, height: 24.h),
            SizedBox(height: 4.h),
            Text(
              name,
              style: TextStyle(
                color: isSelected
                ? Color(0xff2E1126)
                : Color(0xffE0E0FF),
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto Flex',
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text('$points point', style: TextStyle( color: isSelected
                ? Color(0xff2E1126)
                : Color(0xffE0E0FF),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto Flex',
              fontSize: 12.sp,)),
          ],
        ),
      ),
    );
  }
}
