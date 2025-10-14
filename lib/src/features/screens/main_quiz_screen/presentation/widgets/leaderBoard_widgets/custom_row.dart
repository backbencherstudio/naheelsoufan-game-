import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/customGreenBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_redBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBorderBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBox.dart';
import '../../../../../../core/constant/images.dart';
import '../custom_boxes_widgets/custom_small_box.dart';
import '../custom_boxes_widgets/custom_whiteBoxes.dart';

class CustomRow extends StatelessWidget {
  final String name;
  final int index;
  final int scores;
  final int right;
  final int wrong;
  final int skip;

  const CustomRow({
    super.key,
    required this.index,
    required this.name,
    required this.scores,
    required this.right,
    required this.wrong,
    required this.skip,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (index == 1)
            ? CustomSmallBox(
          width: 20.w,
              title: index.toString(),
              icon: '',
              isIconOpen: false,
            )
            : (index == 4)
            ? CustomWhiteboxes(
          width: 20.w,
              title: index.toString(),
              isIconOpen: false,
              icon: '',
            )
            : CustomYellowborderbox(
          width: 20.w,
              title: index.toString(),
              icon: '',
              isIconOpen: false,
            ),

        SizedBox(width: isPortrait ? 8.w : 30.h),

        (index == 1)
            ? CustomSmallBox(
              title: name,
              icon: AppImages.trophy,
              width: isPortrait ? 221.w : 486.2.h,
              isIconOpen: true,
            )
            : (index == 4)
            ? CustomWhiteboxes(
              title: name,
              icon: "",
              isIconOpen: false,
              width: isPortrait ? 221.w : 486.2.h,
            )
            : CustomYellowborderbox(
              title: name,
              icon: AppImages.madel,
              isIconOpen: true,
              width: isPortrait ? 216.w : 486.2.h,
            ),

        SizedBox(width: isPortrait ? 8.w : 35.h),

        (index == 1) ? CustomSmallBox(title: scores.toString(), icon: "", isIconOpen: false, width: 50.w,) :
        (index == 4) ? CustomWhiteboxes(title: scores.toString(), icon: "", isIconOpen: false, width: 50.w,) :
        CustomYellowborderbox(
          width: 50.w,
          title: scores.toString(),
          icon: "",
          isIconOpen: false,
        ),

        SizedBox(width: isPortrait ? 8.w : 30.h),

        Customgreenbox(title: right.toString(), icon: '', isIconOpen: false),

        SizedBox(width: isPortrait ? 8.w : 50.h),

        CustomRedbox(title: wrong.toString(), icon: '', isIconOpen: false),

        SizedBox(width: isPortrait ? 8.w : 45.h),

        CustomYellowbox(title: skip.toString(), icon: '', isIconOpen: false),
      ],
    );
  }
}
