import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/features/screens/home_screens/widget/home_widgets/custom_button.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String text;
  final String? secondaryImg;
  const CustomCard({
    super.key,
    required this.img,
    required this.text,
    this.secondaryImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 258.h,
      width: double.infinity,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: CustomButton(text: text, onTap: () {}),
        ),
      ),
    );
  }
}
