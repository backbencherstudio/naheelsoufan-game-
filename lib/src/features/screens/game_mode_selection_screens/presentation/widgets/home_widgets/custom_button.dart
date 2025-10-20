import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naheelsoufan_game/src/core/constant/images.dart';
import 'package:naheelsoufan_game/src/core/theme/theme_extension/color_scheme.dart';

import '../../../../../../core/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? img;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.img,
  });
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img ?? AppImages.primaryButton),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: style.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
