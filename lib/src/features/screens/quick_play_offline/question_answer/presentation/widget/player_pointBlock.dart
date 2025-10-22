import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../data/riverpod/game/start_game/start_game_provider.dart';

class PlayerPointBlock extends StatelessWidget {
  final String playerName;
  final int? blockCardState;

  const PlayerPointBlock({
    super.key,
    required this.playerName,
    this.blockCardState,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight*0.3,
      padding: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient:LinearGradient(colors: (blockCardState == 2) ? [
            AppColorScheme.softYellow,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow,
          ]:  [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
          ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight
          )
      ),
      child: Padding(
        padding: EdgeInsets.all(0.5.r),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient:
              LinearGradient(
                colors: (blockCardState == 2) ? [
                  AppColorScheme.softYellow,
                  AppColorScheme.midYellow,
                  AppColorScheme.darkYellow,
                ] : (blockCardState == -1) ? [
                  AppColorScheme.primaryTextColor,
                  AppColorScheme.primaryTextColor,
                  AppColorScheme.primaryTextColor,
                ] : (blockCardState == 1) ? [
                  AppColorScheme.startGradGreen,
                  AppColorScheme.midGradGreen,
                  AppColorScheme.startGradGreen,
                ] : (blockCardState == 0) ? [
                  AppColorScheme.purpleContainerColor,
                  AppColorScheme.purpleContainerColor,
                  AppColorScheme.purpleContainerColor,
                ] : [
                  AppColorScheme.socialBack,
                  AppColorScheme.socialBack,
                  AppColorScheme.socialBack,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(
                  color: AppColorScheme.pointBlockBorderColor,
                  width: 1.w
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppIcons.playerpoint,
                  colorFilter: ColorFilter.mode((blockCardState == 2) ? AppColorScheme.labelTextColor : Colors.white, BlendMode.srcIn),
                ),
                Text(
                  playerName,
                  style: style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color:
                      (blockCardState == 2) ? Color(0xFF2E1126) : Colors.white
                  ),
                ),
                Consumer(
                  builder: (_, ref, _) {
                    final response = ref.watch(questionResponseProvider);
                    return Text(
                      (blockCardState == 1) ? "${response?.data?.question.points} points" : "0 point",
                      style: style.labelMedium!.copyWith(
                        color: AppColorScheme.newText,
                        fontSize: 10.sp
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}