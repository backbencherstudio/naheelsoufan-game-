import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class CustomPlaygamesButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomPlaygamesButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "PLAY",
              style: style.titleMedium!.copyWith(color: AppColorScheme.labelTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
