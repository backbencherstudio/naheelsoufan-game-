import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class RowText extends StatelessWidget {
  final String title;
  final String description;

  const RowText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: style.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColorScheme.labelTextColor,
            ),
          ),
        ),
        // SizedBox(width: 20), 
        Expanded(
          child: Text(
            ": $description",
            style: style.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColorScheme.labelTextColor,
            ),
            textAlign: TextAlign.left, 
          ),
        ),
      ],
    );
  }
}
