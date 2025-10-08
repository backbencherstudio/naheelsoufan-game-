import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/utils/utils.dart';

class FreeGametile extends StatelessWidget {
  const FreeGametile({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      width:212.w ,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.freeGame),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.redDmd, height: 32.h, width: 32.w),
            SizedBox(width: 12.w),
            Text(
              "FREE GAME",
              style: style.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 26.sp,
                color: AppColorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
