import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';

class CrownStack extends StatelessWidget {
  final String? iconUrl;
  const CrownStack({
    super.key,
    this.iconUrl
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: isPortrait ? 90.h : 40.5.w,
      width: isPortrait ? 120.w : 264.h,
      child: Stack(

        alignment: Alignment.center,

        children: [
          Positioned(
            bottom: 0,
            height: isPortrait ? 40.h : 18.w,
            width: isPortrait ? 40.w : 88.h,
            child: iconUrl == null ? SvgPicture.asset(AppIcons.profileIcons) : Image.asset(iconUrl!),
          ),
          Positioned(
            right: 0,
            top: isPortrait ? 5.h : 2.25.w,
            child: Image.asset(AppImages.crown,
              height: isPortrait ? 80.h : 36.w,
              width: isPortrait ? 80.w : 176.h,
            ),
          ),
        ],
      ),
    );
  }
}