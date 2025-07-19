import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomHeaderTile extends StatelessWidget {
  const CustomHeaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColorScheme.containerColor,

      ),
      child:Column(
        children: [
          Text("ENJOY 1 FREE GAME",
          style: style.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColorScheme.primary,
          ),
          
          ),
          SizedBox(height: 8,),
          Text("1 Game, Maximum 4 Player in a room",
          style: style.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColorScheme.primary,
          ),
          
          ),
        ],
      ) ,
    );
  }
}