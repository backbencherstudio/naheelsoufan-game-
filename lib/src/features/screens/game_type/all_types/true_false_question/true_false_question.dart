import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../riverpod/true_false_provider.dart';

class TrueFalseQuestion extends ConsumerWidget {
  final String question;

  const TrueFalseQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(trueFalseAnswerProvider);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(trueFalseAnswerProvider.notifier).state = "True";
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedAnswer == "True"
                      ? Colors.green
                      : AppColorScheme.optionBg,
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "True",
                  style: textTheme.bodyLarge!.copyWith(
                    color: selectedAnswer == "True"
                        ? AppColorScheme.white
                        : AppColorScheme.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(trueFalseAnswerProvider.notifier).state = "False";
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedAnswer == "False"
                      ? Colors.red
                      : AppColorScheme.optionBg,
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "False",
                  style: textTheme.bodyLarge!.copyWith(
                    color: selectedAnswer == "False"
                        ? AppColorScheme.white
                        : AppColorScheme.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
