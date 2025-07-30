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
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        Column(
          children: [

            Text("Rank"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            CustomSmallBox(title: '01', icon: '', isIconOpen: false),
          ],
        ),

        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [
             Text("Name"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            CustomSmallBox(
              title: 'Player Name',
              icon: AppImages.trophy,
            
              width: isPortrait ? 221.w : 486.2.h,
            
              isIconOpen: true,
            ),
          ],
        ),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [

             Text("Score"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            CustomSmallBox(title: '750', icon: "", isIconOpen: false),
          ],
        ),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),

        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [

             Text("Right"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            Customgreenbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [
             Text("Wrong"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            CustomRedbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [
             Text("Steal"),
            SizedBox(height: isPortrait ? 9.h : 4.05.w,),
            CustomYellowbox(title: '01', icon: '', isIconOpen: false),
          ],
        ),
      ],
    );
  }
}
