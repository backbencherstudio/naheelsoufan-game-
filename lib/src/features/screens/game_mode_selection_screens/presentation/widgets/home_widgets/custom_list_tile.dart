import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/utils/utils.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;
  const CustomListTile({super.key, required this.title, required this.icon,
  required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final isNotTab = Utils.isTablet(context);
    return Container(
      height: isNotTab ? 58.h : 100.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColorScheme.listContainerColor,
        border: Border(
          bottom: BorderSide(
            color: AppColorScheme.darkpurpleborder,
            width: isNotTab ? 4.w : 4.h,
          ),
        ),
      ),
      child: ListTile(
        onTap: ()=> onTap(),
        title: Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: style.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColorScheme.deepPuroleBG,
          ),
        ),
        leading: SvgPicture.asset(icon),
        trailing: SvgPicture.asset(AppIcons.forwardIcon),
      ),
    );
  }
}
