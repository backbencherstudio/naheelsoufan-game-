import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/theme_extension/color_scheme.dart';

class CustomGridDifficultyTitle extends StatelessWidget {
  final String categoryName;
  const CustomGridDifficultyTitle({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColorScheme.surface,
            AppColorScheme.midGradGreen,
            AppColorScheme.hardGradGreen,
          ]),
          borderRadius: BorderRadius.circular(26.4.r),
          border: Border.all(width: isPortrait ? 2.w : 4.4.h, color: AppColorScheme.greenborder)
      ),
      child: RichText(text: TextSpan(text: categoryName, style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w400, fontSize: 6.3.sp
      )
      ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
