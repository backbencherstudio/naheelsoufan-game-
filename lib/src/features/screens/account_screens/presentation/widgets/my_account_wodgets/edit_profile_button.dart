import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constant/icons.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3D4279),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xffE0E0FF),width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.editIcon, height: 16.h, width: 16.w),
            SizedBox(width: 16.w),
            Text(
              'Edit Profile',
              style: style.bodyMedium?.copyWith(
                color: Color(0xffE0E0FF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
