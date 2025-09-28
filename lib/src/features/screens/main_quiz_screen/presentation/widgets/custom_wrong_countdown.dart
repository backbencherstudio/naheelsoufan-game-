import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../data/riverpod/count_down_state.dart';

final wrongCounterProvider = StateNotifierProvider.family<AutoCounter, CountdownModel, int>(
      (ref, initialSeconds) {
    return AutoCounter(initial: initialSeconds);
  },
);

class CustomWrongCountdown extends ConsumerStatefulWidget {
  final int startFrom;
  final VoidCallback onCompleted;

  const CustomWrongCountdown({
    super.key,
    this.startFrom = 5,
    required this.onCompleted,
  });

  @override
  ConsumerState<CustomWrongCountdown> createState() => _CustomWrongCountdownState();
}

class _CustomWrongCountdownState extends ConsumerState<CustomWrongCountdown> {
  CountdownModel? _previousCountdown;

  @override
  void initState() {
    super.initState();

    // Reset and start the countdown timer once when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(wrongCounterProvider(widget.startFrom).notifier);
      notifier.resetAndStart();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final countdown = ref.watch(wrongCounterProvider(widget.startFrom));

    // Listen for countdown zero to trigger onCompleted callback
    ref.listen<CountdownModel>(
      wrongCounterProvider(widget.startFrom),
          (previous, next) {
        if (previous != null && previous.remaining != 0 && next.remaining == 0) {
          widget.onCompleted();
        }
        _previousCountdown = next;
      },
    );

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
            child: Text(
              "${countdown.remaining}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColorScheme.errorColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



