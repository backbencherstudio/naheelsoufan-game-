import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../riverpod/common_state_control.dart';

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
                color: ref.read(specialButtonController(buttonId).notifier).state ? Color(0xFFFFB4AB) : Color(0xFF00024C)),
          ),
          gradient: LinearGradient(colors: ref.read(specialButtonController(buttonId).notifier).state ?
          [
            Color(0xFFF2E792),
            Color(0xFFF8B133),
            Color(0xFFDE712B)
          ] : [
            Color(0xFF3D4279),
            Color(0xFF3D4279)
          ]
          ),
        ),
        child: Center(
            child: Text(buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            )
        ),
      ),
    );
  }
}
