import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomLogoutButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomLogoutButton({super.key,
  
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
        final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border(bottom: BorderSide(color: AppColorScheme.error, width: 4.w), ),
         gradient: LinearGradient(colors: [
          AppColorScheme.redGrad,
          AppColorScheme.redGrad2,
         ],
         
         begin: Alignment.centerLeft,
         end: Alignment.centerRight,
         )
          
        ),
      
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
            child: Text("Logout",
            style:style.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColorScheme.onPrimary
            ) ,
            ),
          ),
        ),
      ),
    );
  }
}
