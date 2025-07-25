import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  final List<String> choices;
  final String question;
  const MultipleChoiceQuestion({super.key, required this.choices, required this.question});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        Text(
          question,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: isPortrait ? 24.sp : 10.8.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isPortrait ? 40.h : 18.w),
        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: isPortrait ? 8.w : 17.6.h,
            crossAxisSpacing: isPortrait ? 8.w : 17.6.h,
            childAspectRatio: isPortrait ? 3 : 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isPortrait ? 12.r : 26.4.r),
                color: AppColorScheme.optionBg,
                boxShadow: [
                  BoxShadow(
                    color: AppColorScheme.answerBoxShadow,
                    blurRadius: isPortrait ? 25.r : 55.r,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border(
                  bottom: BorderSide(
                    color: AppColorScheme.labelTextColor,
                    width: isPortrait ? 4.r : 8.8.r,
                  ),
              ),),
              child: ElevatedButton(
                onPressed: () {
                  // Handle choice selection
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColorScheme.optionBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isPortrait ? 12.r : 26.4.r),
                  ),
                ),
                child: Text(
                  choices[index],
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: isPortrait ? 16.sp : 7.2.sp,
                    color: AppColorScheme.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
