// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../../core/constant/icons.dart';
// import '../../../../../data/riverpod/count_down_state.dart';
//
// class CustomWrongCountdown extends ConsumerStatefulWidget {
//   final int initTime;
//   const CustomWrongCountdown({
//     super.key,
//     required this.initTime,
//   });
//
//   @override
//   ConsumerState<CustomWrongCountdown> createState() => _CustomWrongCountdownState();
// }
//
// class _CustomWrongCountdownState extends ConsumerState<CustomWrongCountdown> {
//   String _formatTime(int seconds) {
//     final mins = seconds ~/ 60;
//     final secs = seconds % 60;
//     if (mins > 0) {
//       return '$mins:${secs.toString().padLeft(2, '0')}';
//     }
//     return secs.toString();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Listen for the pause event: when isRunning goes from true -> false
//     ref.listen<CountdownModel>(
//       autoCounterProvider(widget.initTime),
//           (previous, next) {
//         if (previous != null &&
//             previous.isRunning &&
//             !next.isRunning &&
//             previous.remaining != next.remaining) {
//           // This was a pause (not just a reset to same state)
//           ref.read(advanceTurnTriggerProvider.notifier).state++;
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final style = Theme.of(context).textTheme;
//     final bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//
//     final countdown = ref.watch(autoCounterProvider(widget.initTime));
//
//     return GestureDetector(
//       onTap: () {
//         if (Navigator.canPop(context)) {
//           Navigator.of(context).pop();
//         }
//       },
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           SvgPicture.asset(
//             AppIcons.circleSgv,
//             width: isPortrait ? 36.w : 79.h,
//             height: isPortrait ? 36.h : 16.2.w,
//           ),
//           Padding(
//             padding: EdgeInsets.all(2.r),
//             child: Text(
//               _formatTime(countdown.remaining),
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../../../core/constant/icons.dart';
import '../riverpod/count_down_logic.dart';

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
    final time = ref.watch(countdownProvider(startFrom));

    // Listen for completion
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
            width: 36.w,
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.all(2.r),
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



