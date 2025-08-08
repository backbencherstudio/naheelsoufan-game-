import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../../../data/riverpod/count_down_state.dart';

class CustomCountdown extends ConsumerStatefulWidget {
  final int initTime;
  final VoidCallback? onPaused;

  const CustomCountdown({
    super.key,
    required this.initTime,
    this.onPaused,
  });

  @override
  ConsumerState<CustomCountdown> createState() => _CustomCountdownState();
}

class _CustomCountdownState extends ConsumerState<CustomCountdown> {

  CountdownModel? _previous;

  @override
  Widget build(BuildContext context) {
    final countdown = ref.watch(autoCounterProvider(widget.initTime));

    ref.listen<CountdownModel>(
      autoCounterProvider(widget.initTime),
          (previous, next) {
            if (next.remaining == 0 && previous?.remaining != 0) {
              widget.onPaused?.call();
            }
            _previous = next;
            },
    );

    final style = Theme.of(context).textTheme;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

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
                countdown.remaining.toString(),
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
