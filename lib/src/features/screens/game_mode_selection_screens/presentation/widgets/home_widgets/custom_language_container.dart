import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomLanguageContainer extends StatelessWidget {
  const CustomLanguageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      width: 148.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColorScheme.primary,
      ),
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.languageIcon),
            SizedBox(width: 4.w),
            Text("US English",  style: style.labelLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColorScheme.deepPuroleBG
            ),),
            Spacer(),
            SvgPicture.asset(AppIcons.dropdownIcon),
          ],
        ),
      ),
    );
  }
}
