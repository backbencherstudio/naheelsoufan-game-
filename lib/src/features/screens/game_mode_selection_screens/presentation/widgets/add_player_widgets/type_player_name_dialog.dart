import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';

void showNameDialog(BuildContext context, String title) {
  final style = Theme.of(context).textTheme;

  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 337.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE0E0FF), width: 2),
                color: const Color(0xff3D4279),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type Player Name',
                    style: style.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  const Divider(color: Colors.white),
                  SizedBox(height: 32.h),

                  Text(
                    title,
                    style: style.bodyMedium?.copyWith(
                      color: const Color(0xffE0E0FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  TextFormField(
                    style: style.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Player Name',
                      hintStyle: style.bodyMedium?.copyWith(
                        color: const Color(0xff6B71B9),
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: const Color(0xffE0E0FF),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Confirm',
                      onTap: () {
                        Navigator.pop(context); // Close dialog
                      },


                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
