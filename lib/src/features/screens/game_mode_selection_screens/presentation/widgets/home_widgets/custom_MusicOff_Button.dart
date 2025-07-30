import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';

class CustomOnOffButton extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final SvgPicture? picture;
  final SvgPicture? pictureBg;
  const CustomOnOffButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.picture, this.pictureBg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        child: Stack(
          alignment: Alignment.center,
          children: [
           pictureBg ?? SvgPicture.asset(AppIcons.bgblue),
            Positioned(
              top: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: picture ?? SvgPicture.asset(AppIcons.musicIcon),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 0,
                bottom: 0,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SvgPicture.asset(
                    AppIcons.redvector,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
