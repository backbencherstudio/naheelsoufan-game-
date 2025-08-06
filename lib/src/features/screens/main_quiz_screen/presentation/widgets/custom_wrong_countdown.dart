import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../core/constant/icons.dart';
import '../riverpod/count_down_logic.dart';
final countdownProvider = StateNotifierProvider.family<CountdownNotifier, int, int>(
      (ref, start) => CountdownNotifier(start),
);
class CustomWrongCountdown extends ConsumerWidget {
  final int startFrom;
  final VoidCallback onCompleted;
  const CustomWrongCountdown({
    super.key,
    this.startFrom = 5,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final time = ref.watch(countdownProvider(startFrom));

    ref.listen<int>(countdownProvider(startFrom), (prev, next) {
      if (next == 0 && prev != 0) {
        onCompleted();
      }
    });

    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.circleSgv,
            width: isPortrait ? 36.w : 79.2.h,
            height: isPortrait ? 36.h : 79.2.h,
          ),
          Padding(
            padding: EdgeInsets.all(isPortrait ? 2.r : 4.4.r),
            child: Text("$time",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColorScheme.errorColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}



