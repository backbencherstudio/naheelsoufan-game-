import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constant/icons.dart';
import '../home_widgets/custom_icons_Buttons.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/player_selection_widgets/type_player_name_selection_dialog.dart';

class SelectionTile extends ConsumerWidget {
  final String index;
  final String playerName;
  final bool isSelected;
  final Color? color;
  final void Function()? onTap;
  final void Function()? onTabRemove;

  const SelectionTile({
    super.key,
    required this.index,
    required this.playerName,
    required this.onTap,
    required this.isSelected,
    this.color,
    this.onTabRemove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  (isSelected
                      ? const Color(0xff63DF7C)
                      : const Color(0xffC9C6C5)),
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
                    onTap: () {
                      final playerIndex = int.tryParse(index) ?? 1;
                      showSelectionNameDialog(
                        context,
                        ref,
                        playerIndex,
                        playerName,
                      );
                    },
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
            bgIcon: isSelected ? AppIcons.goldenBG : AppIcons.greyBG,
          ),
        ],
      ),
    );
  }
}
