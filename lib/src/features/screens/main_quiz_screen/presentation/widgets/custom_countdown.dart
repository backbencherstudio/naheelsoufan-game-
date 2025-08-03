import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../data/riverpod/count_down_state.dart';

class CustomCountdown extends ConsumerWidget {
  const CustomCountdown({super.key});

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    if (mins > 0) {
      return '$mins:${secs.toString().padLeft(2, '0')}';
    }
    return secs.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final countdown = ref.watch(autoCounterProvider(10));
    final controller = ref.read(autoCounterProvider(10).notifier);

    return Container(
      padding: isPortrait
          ? EdgeInsets.all(4.r)
          : EdgeInsets.symmetric(horizontal: 12.h),
      decoration: BoxDecoration(
        borderRadius:
        isPortrait ? null : BorderRadius.all(Radius.circular(50.r)),
        shape: isPortrait ? BoxShape.circle : BoxShape.rectangle,
        color: AppColorScheme.softGradGreen.withValues(alpha: 0.2),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            isPortrait ? AppIcons.stopWatch : AppIcons.landScapeStopWatch,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _formatTime(countdown.remaining),
                style: (style.headlineLarge ?? const TextStyle()).copyWith(
                  fontSize: isPortrait ? 32.sp : 14.4.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
