import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/customGreenBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_redBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBorderBox.dart';
import 'package:naheelsoufan_game/src/features/screens/main_quiz_screen/presentation/widgets/custom_boxes_widgets/custom_yellowBox.dart';

class Customrowtwo extends StatelessWidget {
  final String name;
  final String id;
  final String scores;
  final String icons;
  const Customrowtwo({super.key,
  required this.id,
  required this.name,
  required this.scores,
  required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomYellowborderbox(title: id, icon: '', isIconOpen: false),

        SizedBox(width: 8.w),
        CustomYellowborderbox(
          title: 'Player Name',
          icon: icons,
          isIconOpen: true,
                    width: 216.w,

        ),
        SizedBox(width: 8.w),
        CustomYellowborderbox(title: '750', icon: "", isIconOpen: false),
        SizedBox(width: 8.w),
        
        SizedBox(width: 8.w),
        Customgreenbox(title: '01', icon: '', isIconOpen: false),
        SizedBox(width: 8.w),
        CustomRedbox(title: '01', icon: '', isIconOpen: false),
        SizedBox(width: 8.w),
        CustomYellowbox(title: '01', icon: '', isIconOpen: false,)
      ],
    );
  }
}
