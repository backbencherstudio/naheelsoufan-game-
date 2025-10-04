import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/customGreenBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_redBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_whiteBoxes.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBox.dart';

class CustomRowthree extends StatelessWidget {
  final String name;
  final String id;
  final String scores;
  final String right;
  final String wrong;
  final String skip;
  const CustomRowthree({super.key,
    required this.id,
    required this.name,
    required this.scores, required this.right, required this.wrong, required this.skip,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        CustomWhiteboxes(title: id, isIconOpen: false, icon:'' ,),

        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        SizedBox(
          width: 350.w,
          child: CustomWhiteboxes(
            title: name,
            icon: "",
            isIconOpen: true,
            width: isPortrait ? 221.w :486.2.h,
          ),
        ),
        SizedBox(width: isPortrait ? 12.w : 17.6.h),
        SizedBox(width: 100.w, child: CustomWhiteboxes(title: scores, icon: "", isIconOpen: false)),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        Customgreenbox(title: right, icon: '', isIconOpen: false),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        CustomRedbox(title: wrong, icon: '', isIconOpen: false),
        SizedBox(width: isPortrait ? 8.w : 17.6.h),
        CustomYellowbox(title: skip, icon: '', isIconOpen: false,)
      ],
    );
  }
}