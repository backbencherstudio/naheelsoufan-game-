import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/icons.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AppIcons.backSvg, width: 40.w, height: 40.h),
        ),
        Image.asset(AppIcons.profileIcon, width: 40.w, height: 40.h),
        SvgPicture.asset(AppIcons.threeDotSvg, width: 40.w, height: 40.h),
      ],
    );
  }
}
