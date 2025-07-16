import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naheelsoufan_game/src/core/constant/icons.dart';

class CustomIconsButtons extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  final String? bgIcon;
  const CustomIconsButtons({
    super.key,
    required this.icon,
    required this.onTap,
    this.bgIcon
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: SvgPicture.asset(bgIcon?? AppIcons.iconBG)),
          Positioned(child: SvgPicture.asset(icon)),
        ],
      ),
    );
  }
}
