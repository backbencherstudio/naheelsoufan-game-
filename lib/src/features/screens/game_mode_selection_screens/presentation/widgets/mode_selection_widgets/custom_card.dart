import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/presentation/widgets/home_widgets/custom_button.dart';

import '../../../../../../core/utils/utils.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String text;
  final void Function()? onTap;
  final String? secondaryImg;
  const CustomCard({
    super.key,
    required this.img,
    required this.text,
    required this.onTap,
    this.secondaryImg,
  });

  @override
  Widget build(BuildContext context) {
    final isNotTab = Utils.isTablet(context);
    return Container(
      height: isNotTab ? 258.h : 330.h,
      width: double.infinity,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: isNotTab ? BoxFit.cover : BoxFit.fitHeight,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: isNotTab ? 20.h : 45.h),
          child: CustomButton(text: text, onTap: onTap, img: secondaryImg,),
        ),
      ),
    );
  }
}
