import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constant/images.dart';
import 'customGreenBox.dart';
import 'custom_redBox.dart';
import 'custom_small_box.dart';
import 'custom_whiteBoxes.dart';
import 'custom_yellowBorderBox.dart';
import 'custom_yellowBox.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (index == 1)
            ? CustomSmallBox(
          width: isPortrait ? 30.w : 20.w,
          title: index.toString(),
          icon: '',
          isIconOpen: false,
        )
            : (index == 4)
            ? CustomWhiteboxes(
          width: isPortrait ? 30.w : 20.w,
          title: index.toString(),
          isIconOpen: false,
          icon: '',
        )
            : CustomYellowborderbox(
          width: isPortrait ? 30.w : 20.w,
          title: index.toString(),
          icon: '',
          isIconOpen: false,
        ),

        (index == 1)
            ? CustomSmallBox(
          title: name,
          icon: AppImages.trophy,
          width: isPortrait ? 225.w : 486.2.h,
          isIconOpen: true,
        )
            : (index == 4)
            ? CustomWhiteboxes(
          title: name,
          icon: "",
          isIconOpen: false,
          width: isPortrait ? 225.w : 486.2.h,
        )
            : CustomYellowborderbox(
          title: name,
          icon: AppImages.madel,
          isIconOpen: true,
          width: isPortrait ? 225.w : 486.2.h,
        ),

        (index == 1) ? CustomSmallBox(title: scores.toString(), icon: "", isIconOpen: false, width: screenWidth*0.2,) :
        (index == 4) ? CustomWhiteboxes(title: scores.toString(), icon: "", isIconOpen: false, width: screenWidth*0.2,) :
        CustomYellowborderbox(
          title: scores.toString(),
          icon: "",
          isIconOpen: false,
          width: screenWidth*0.2,
        ),

        Customgreenbox(title: right.toString(), icon: '', isIconOpen: false, width: screenWidth*0.1,),

        CustomRedbox(title: wrong.toString(), icon: '', isIconOpen: false),

        CustomYellowbox(title: skip.toString(), icon: '', isIconOpen: false),
      ],
    );
  }
}