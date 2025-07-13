import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/icons.dart';

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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: SvgPicture.asset(img ?? AppIcons.primaryButton)),
          Positioned(
            child: Center(
              child: Center(
                child: Text(
                  text,
                  style: style.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
