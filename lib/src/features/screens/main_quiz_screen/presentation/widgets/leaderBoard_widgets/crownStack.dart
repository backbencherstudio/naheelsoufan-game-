import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';

class Crownstack extends StatelessWidget {
  const Crownstack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 120.w,
      child: Stack(

        alignment: Alignment.center,

        children: [
          Positioned(
              bottom: 0,
              child: SvgPicture.asset(AppIcons.profileIcons,
                height: 40.h,
                width: 40.h,

              )),
          Positioned(
            right: 0,
            top: 5,
            child: Image.asset(AppImages.crown,
              height: 80.h,
              width: 80.w,
            ),
          ),
        ],
      ),
    );
  }
}