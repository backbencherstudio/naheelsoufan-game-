import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_game_logo_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_playgames_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/row_text.dart';

class FreeGameCard extends StatelessWidget {
  final void Function()? onTap;
  final String mode;
  final int maxPlayer;
  final int gameNumber;

  const FreeGameCard({super.key, required this.onTap, required this.mode, required this.maxPlayer, required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(8.r),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xff2E1126)),
        gradient: LinearGradient(
          colors: [
            AppColorScheme.softYellow,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomGameLogoContainer(),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ENJOY 1 FREE GAME",
                      style: style.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: AppColorScheme.labelTextColor,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    RowText(title: 'Mode ', description: mode),
                    RowText(title: 'Games ', description: '$gameNumber Game(s)'),
                    RowText(
                      title: 'Max Players ',
                      description: 'Up to $maxPlayer Players',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomPlaygamesButton(onTap: onTap),
        ],
      ),
    );
  }
}