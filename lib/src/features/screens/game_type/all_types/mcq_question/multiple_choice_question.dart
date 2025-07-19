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

    return Column(
      children: [
        Text(
          question,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        GridView.builder(
          itemCount: choices.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3, // Wider buttons
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Handle choice selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorScheme.optionBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                choices[index],
                style: textTheme.bodyLarge!.copyWith(
                  color: AppColorScheme.surface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
