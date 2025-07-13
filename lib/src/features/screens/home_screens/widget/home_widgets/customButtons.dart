import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';

class CustomIconsButtons extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  const CustomIconsButtons({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned(child: SvgPicture.asset(AppIcons.iconBG)),
          Positioned(left: 8, top: 8, child: SvgPicture.asset(icon)),
        ],
      ),
    );
  }
}
