import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class RoomLinkBox extends StatelessWidget {
  const RoomLinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColorScheme.primary),
              color: AppColorScheme.containerColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "www.game.com/room12345-XYZ]",
                  style: style.labelLarge!.copyWith(
                    fontSize: 16.sp,
                    color: AppColorScheme.greenery,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(AppIcons.copyIcon),
              ],
            ),
          ),
        ),

        SizedBox(width: 8.w),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColorScheme.primary,
          ),
          child: SvgPicture.asset(AppIcons.shareIcon),
        ),
      ],
    );
  }
}
