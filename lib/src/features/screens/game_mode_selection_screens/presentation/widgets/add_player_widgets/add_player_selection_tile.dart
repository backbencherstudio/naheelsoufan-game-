import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/icons.dart';
import '../add_player_widgets/type_player_name_dialog.dart';
import '../home_widgets/custom_icons_Buttons.dart';

class AddSelectionTile extends StatelessWidget {
  final String index;
  final String playerName;   // pass player name here
  final bool isSelected;
  final Color? color;
  final void Function()? onTap;
  final void Function()? onTabRemove;

  const AddSelectionTile({
    super.key,
    required this.index,
    required this.playerName,  // new
    required this.onTap,
    required this.isSelected,
    this.color,
    this.onTabRemove,
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
              color:
              color ??
                  (isSelected ? const Color(0xffB8F1B9) : const Color(0xffC9C6C5)),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xff5F5E5E)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.profile),
                  SizedBox(width: 11.w),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      playerName.isEmpty ? "Player $index" : playerName,
                      style: style.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff5F5E5E),
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (isSelected) SvgPicture.asset(AppIcons.tick),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.h),
          CustomIconsButtons(
            icon: AppIcons.substract,
            onTap: onTabRemove,
            bgIcon: isSelected ? AppIcons.redBGsqare : AppIcons.greyBG,
          ),
        ],
      ),
    );
  }
}
