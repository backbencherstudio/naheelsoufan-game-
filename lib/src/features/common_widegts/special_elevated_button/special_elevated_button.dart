import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';
import '../../../data/riverpod/common_state_control.dart';

class SpecialElevatedButton extends ConsumerWidget {
  final int buttonId;
  final String buttonName;

  const SpecialElevatedButton({
    super.key,
    required this.buttonId,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchButton = ref.watch(specialButtonController(buttonId));
    bool isSpecialClick = ref.read(specialButtonController(buttonId).notifier).state;
    return GestureDetector(
      onTap: () {
        ref
            .read(specialButtonController(buttonId).notifier)
            .state = !isSpecialClick;
        for (int id = 1; id < 4; id++) {
          if (id != buttonId) {
            ref.read(specialButtonController(id).notifier).state = false;
          }
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: 313.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border(
            bottom: BorderSide(width: 3.sp,
                color: ref.read(specialButtonController(buttonId).notifier).state ? AppColorScheme.lightButtonborder : AppColorScheme.darkpurpleborder),
          ),
          gradient: LinearGradient(colors: ref.read(specialButtonController(buttonId).notifier).state ?
          [
            AppColorScheme.softYellow,
            AppColorScheme.midYellow,
            AppColorScheme.darkYellow
          ] : [
            AppColorScheme.deepPuroleBG,
            AppColorScheme.deepPuroleBG
          ]
          ),
        ),
        child: Center(
            child: Text(buttonName,
              style: Theme.of(context).textTheme.titleSmall,
            )
        ),
      ),
    );
  }
}
