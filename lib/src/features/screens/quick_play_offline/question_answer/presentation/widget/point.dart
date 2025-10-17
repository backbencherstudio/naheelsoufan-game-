import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class PointShow extends StatelessWidget {
  const PointShow({super.key});

  @override
  Widget build(BuildContext context) {
        final style = Theme.of(context).textTheme;
        bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: isPortrait ? 116.w : 255.2.h,
      padding: EdgeInsets.all(8.r),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: AppColorScheme.borderColor
               ),
       

      child: Center(child: Text("100 Points",
       style: style.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.deepPuroleBG,
         fontSize: isPortrait ? 16.sp : 7.2.sp
                ),
      
      )),
    );
  }
}