import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_game_logo_container.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/custom_playgames_button.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/free_game_widgets/row_text.dart';

class FreeGameCard extends StatelessWidget {
  final void Function()? onTap;
  const FreeGameCard({super.key,
  required this.onTap,
  });

  @override 
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(8.r),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xff2E1126)),
        gradient: LinearGradient(
          colors: [Color(0xffF2E792), Color(0xffF8B133), Color(0xffDE712B)],
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
                        color: Color(0xff2E1126),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    RowText(title: 'Mode ', description: 'Grid Play'),
                    RowText(title: 'Games ', description: '1 Games'),
                    RowText(
                      title: 'Max Players ',
                      description: 'Up to 4 Players',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomPlaygamesButton(onTap:onTap),

        ],
      ),
    );
  }
}
