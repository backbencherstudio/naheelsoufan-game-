import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_icons_Buttons.dart';

class SelectionTile extends StatelessWidget {
  final String index;
  final bool iselected;
  final void Function()? onTap;
  const SelectionTile({super.key,
  required this.index,
  required this.onTap,
  required this.iselected,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 253.w,
            decoration: BoxDecoration(
              color:iselected? Color(0xff63DF7C): Color(0xffC9C6C5),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xff5F5E5E)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.profile),
                  SizedBox(width: 11.w),
                  Text(
                    "Player $index",
                    style: style.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff5F5E5E),
                    ),
                  ),
                  Spacer(),
  if (iselected) SvgPicture.asset(AppIcons.tick),                  
                ],
              ),
            ),
          ),
          SizedBox(width: 12.h),
          CustomIconsButtons(
            icon: AppIcons.substract,
            onTap: () {},
            bgIcon: iselected? AppIcons.goldenBG: AppIcons.greyBG,
          ),
        ],
      ),
    );
  }
}
