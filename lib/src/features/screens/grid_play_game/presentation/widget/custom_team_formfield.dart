import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/text_theme.dart';

class CustomTeamFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String teamNo;
  const CustomTeamFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.teamNo
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColorScheme.sweetViolet,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
      color: Color.fromRGBO(34, 34, 34, 0.2),
      offset: Offset(0, 4),
      blurRadius: 25,
      spreadRadius: 0,
          )
        ]
      ),
      child: Column(
        children: [
          SvgPicture.asset(AppIcons.groupProfile),
          SizedBox(height: 4.h,),
          Text("Team $teamNo", style: textTheme.bodyMedium,),
          SizedBox(height: 10.h,),
          TextFormField(
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColorScheme.secondary
            ),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              filled: true,
              fillColor: AppColorScheme.primary,
              hintText: hintText,
              hintStyle: textTheme.bodyMedium?.copyWith(color: AppColorScheme.socialBack)
            ),textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
