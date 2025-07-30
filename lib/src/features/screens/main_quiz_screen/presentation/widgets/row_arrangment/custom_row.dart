import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_small_box.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/customGreenBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_redBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBox.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [

            Text("Rank"),
            SizedBox(height: 9.h,),
            CustomSmallBox(title: '01', icon: '', isIconOpen: false),
          ],
        ),

        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Name"),
            SizedBox(height: 9.h,),
            CustomSmallBox(
              title: 'Player Name',
              icon: AppImages.trophy,

              width: 221,

              isIconOpen: true,
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [

            Text("Score"),
            SizedBox(height: 9.h,),
            CustomSmallBox(title: '750', icon: "", isIconOpen: false),
          ],
        ),
        SizedBox(width: 8.w),

        SizedBox(width: 8.w),
        Column(
          children: [

            Text("Right"),
            SizedBox(height: 9.h,),
            Customgreenbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Wrong"),
            SizedBox(height: 9.h,),
            CustomRedbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Steal"),
            SizedBox(height: 9.h,),
            CustomYellowbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
      ],
    );
  }
}