import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_small_box.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/customGreenBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_redBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBox.dart';

class CustomRow extends StatelessWidget {

  const CustomRow({super.key, required this.name, required this.id, required this.scores, required this.right, required this.wrong, required this.skip});

  final String name;
  final String id;
  final String scores;
  final String right;
  final String wrong;
  final String skip;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        Column(
          children: [

            Text("Rank"),
            SizedBox(height: 9.h,),
            CustomSmallBox(title: id, icon: '', isIconOpen: false),
          ],
        ),

        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Name"),
            SizedBox(height: 9.h,),
            SizedBox(
              width: 350.w,
              child: CustomSmallBox(
                title: name,
                icon: AppImages.trophy,
                width: isPortrait ? 221.w : 486.2.h,
                isIconOpen: true,
              ),
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [

            Text("Score"),
            SizedBox(height: 9.h,),
            SizedBox(width: 100.w, child: CustomSmallBox(title: scores, icon: "", isIconOpen: false)),
          ],
        ),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),

        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Column(
          children: [

            Text("Right"),
            SizedBox(height: 9.h,),
            Customgreenbox(title: right, icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Wrong"),
            SizedBox(height: 9.h,),
            CustomRedbox(title: wrong, icon: '', isIconOpen: false),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text("Skip"),
            SizedBox(height: 9.h,),
            CustomYellowbox(title: skip, icon: '', isIconOpen: false),
          ],
        ),
      ],
    );
  }
}